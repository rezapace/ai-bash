#!/bin/bash

# API key (included directly in the script)
API_KEY="isi api key nya"

# Function to ask Groq API
askgroq() {
    local prompt="$1"
    
    # Make the API request
    local response=$(curl -s -X POST "https://api.groq.com/openai/v1/chat/completions" \
      -H "Authorization: Bearer $API_KEY" \
      -H "Content-Type: application/json" \
      -d '{
        "model": "llama3-8b-8192",
        "messages": [
          {
            "role": "user",
            "content": "'"$prompt"'"
          }
        ]
      }')

    # Extract and print the content
    local content=$(echo "$response" | jq -r '.choices[0].message.content')

    if [ -n "$content" ]; then
      echo "$content"
    else
      echo "No content generated or an error occurred."
      echo "Full response:"
      echo "$response"
    fi
}

# Check if a question is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 \"Your question here\""
    exit 1
fi

# Call the function with the provided question
askgroq "$1"