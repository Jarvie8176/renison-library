#!/bin/bash

kill $(ps aux | grep 'node.*9000' | awk '{print $2}')
kill $(ps aux | grep '0.0.0.0:8000' | awk '{print $2}')
