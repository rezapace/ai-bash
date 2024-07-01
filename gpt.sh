#!/bin/bash

# OpenAI API Key
API_KEY="isi api key nya"

# Function to ask a question
ask() {
    local question="$1"
    local tokens="${2:-500}"
    local return_output="$3"

    # Request body
    body=$(jq -n \
        --arg question "$question" \
        --argjson tokens "$tokens" \
        '{
            model: "text-davinci-003",
            prompt: $question,
            temperature: 0.2,
            max_tokens: $tokens,
            top_p: 1,
            n: 1,
            frequency_penalty: 1,
            presence_penalty: 1
        }')

    # Make the API request
    response=$(curl -s -X POST "https://api.openai.com/v1/completions" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d "$body")

    # Extract the text from the response
    output=$(echo $response | jq -r '.choices[0].text' | xargs)

    # Format the output
    formatted_output="# $question $output"

    # Return or print the output based on the return flag
    if [ "$return_output" = true ]; then
        echo "$formatted_output"
    else
        echo "$formatted_output"
    fi
}