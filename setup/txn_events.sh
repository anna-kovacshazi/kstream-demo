#!/bin/bash
echo -e "{\"type\":\"ADD_PRODUCT\", \"date\":\"2023-04-12\", \"store\":\"03745\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
echo -e "{\"type\":\"PAY_BY_CARD\", \"date\":\"2023-04-13\", \"store\":\"03745\", \"till\":\"002\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
echo -e "{\"type\":\"REMOVE_PRODUCT\", \"date\":\"2023-04-14\", \"store\":\"03280\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
echo -e "{\"type\":\"COMPLETE_TXN\", \"date\":\"2023-04-15\", \"store\":\"03745\", \"till\":\"002\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
echo -e "{\"type\":\"APPLY_DISCOUNT\", \"date\":\"2023-04-16\", \"store\":\"03745\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
echo -e "{\"type\":\"ADD_PRODUCT\", \"date\":\"2023-04-17\", \"store\":\"03280\", \"till\":\"001\"}" >> /Users/anna.kovacshazin/Documents/projects/kstream-demo/setup/files/txn_events.json
