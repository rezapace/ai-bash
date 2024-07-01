#!/bin/zsh

# Set your API key
API_KEY="isi api key nya"

# Function to ask Gemini API
askgem() {
    local PROMPT="$1"
    
    # Encode the prompt for URL (not strictly necessary for this use case, but good practice)
    local ENCODED_PROMPT=$(echo $PROMPT | jq -sRr @uri)
    
    # Make the API request
    local response=$(curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=$API_KEY" \
      -H "Content-Type: application/json" \
      -d '{
        "contents": [
          {
            "parts": [
              {
                "text": "'"$PROMPT"'"
              }
            ]
          }
        ]
      }')
    
    # Extract and print the content
    local content=$(echo $response | jq -r '.candidates[0].content.parts[0].text')
    
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
askgem "$1"