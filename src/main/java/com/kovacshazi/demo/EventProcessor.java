package com.kovacshazi.demo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.kstream.Consumed;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KTable;
import org.apache.kafka.streams.kstream.Named;
import org.apache.kafka.streams.kstream.Produced;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * Based on: <a href="https://www.baeldung.com/spring-boot-kafka-streams"></a>
 * More examples: <a href="https://github.com/confluentinc/kafka-streams-examples#examples-apps"></a>
 */

@Component
public class EventProcessor {

    private static final String INPUT_TOPIC = "op_events";
    private static final String OUTPUT_TOPIC = "op_events_by_type";
    private static final Serde<String> STRING_SERDE = Serdes.String();

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    void buildPipeline(StreamsBuilder streamsBuilder) {

        KStream<String, String> eventsStream = streamsBuilder
                .stream(INPUT_TOPIC, Consumed.with(STRING_SERDE, STRING_SERDE));

        KTable<String, String> typesCount = eventsStream
                .mapValues(this::parse)
                .filter((key, value) -> value.isPresent())
                .mapValues(Optional::get)
                .map((key, value) -> KeyValue.pair(value.store(), value.type()))
//                .mapValues(OpEvent::type)
                .toTable(Named.as("op_types"));

        typesCount.toStream().to(OUTPUT_TOPIC, Produced.with(STRING_SERDE, STRING_SERDE));
    }

    private Optional<OpEvent> parse(String data) {
        try {
            return Optional.of(mapper.readValue(data, OpEvent.class));
        } catch (JsonProcessingException e) {
            return Optional.empty();
        }
    }

}
