#!/bin/bash
echo -e "{\"type\":\"OPEN_TILL\", \"date\":\"2023-04-12\", \"store\":\"03745\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"OPEN_CASH_DRAWER\", \"date\":\"2023-04-13\", \"store\":\"03745\", \"till\":\"002\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"REMOVE_CASH_DRAWER\", \"date\":\"2023-04-14\", \"store\":\"03280\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"LOG_IN\", \"date\":\"2023-04-15\", \"store\":\"03745\", \"till\":\"002\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"LOG_OUT\", \"date\":\"2023-04-16\", \"store\":\"03745\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"CLOSE_TILL\", \"date\":\"2023-04-17\", \"store\":\"03280\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json
echo -e "{\"type\":\"OPEN_CASH_DRAWER\", \"date\":\"2023-04-17\", \"store\":\"03280\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/op_events.json