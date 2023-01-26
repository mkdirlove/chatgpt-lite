#!/bin/bash

# API  token and Endpoint URL
API_KEY=${1:-"YOUR_API_KEY"}
ENDPOINT_URL=${2:-"https://api.openai.com/v1/completions"}

install_dependencies() {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Check if toilet and jq are installed
    if ! command -v toilet > /dev/null; then
      echo "Installing toilet..."
      sudo apt-get install toilet
    fi
    if ! command -v jq > /dev/null; then
      echo "Installing jq..."
      sudo apt-get install jq
    fi
  elif [[ "$OSTYPE" == "android" ]]; then
    # Check if toilet and jq are installed
    if ! command -v toilet > /dev/null; then
      echo "Installing toilet..."
      apt install toilet
    fi
    if ! command -v jq > /dev/null; then
      echo "Installing jq..."
      apt install jq
    fi
  else
    echo "Unsupported OS. Manually install toilet and jq."
  fi
}

function main() {
	install_dependencies
	# My fancy banner
	clear
	echo "ChatGPT.sh Lite" | toilet -f smbraille
	echo ""
	
	# Start a new conversation by deleting the old one
	rm -f ./chat.log

	# Continuously ask for questions
	while true; do

	# Display a prompt for the user to enter their question
	read -p "@You > " QUESTION

	# Write the question into the chat.log
	echo "You: $QUESTION " >> ./chat.log

	# Add some nice terminal formatting
	echo "------------"

	# Read the chat.log, including the user's last question, ready to send to chatGPT
	QUERY=$(<./chat.log)

	# Set the JSON payload for the request
	payload="{
	    \"model\":\"text-davinci-003\",
	    \"prompt\":\"$QUERY\",
	    \"max_tokens\": 3500,
	    \"temperature\": 1"

	# Close the JSON payload
	payload="$payload }"

	# Send the request to the OpenAI API
	response=$(curl -sS -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" -d "$payload" "$ENDPOINT_URL" 2>&1)

	# Extract the response from the JSON object
	RESPONSE_MESSAGE=$(echo "$response" | jq -r '.choices[0].text')

	# Print the response
	echo -e "\n"
	echo "@ChatGPT / OpenAI > $RESPONSE_MESSAGE"

	# Write the response into a reponse.log
	echo -n "ChatGPT.sh Lite:$RESPONSE_MESSAGE " >> ./chat.log

	# More fancy terminal formatting
	echo -e "\n------------\n"

	done
}

main
