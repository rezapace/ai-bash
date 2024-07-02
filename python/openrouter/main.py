from openai import OpenAI
from os import getenv
from dotenv import load_dotenv, find_dotenv
import timeit
import streamlit as st

load_dotenv(find_dotenv())


def main():
    # gets API Key from environment variable OPENAI_API_KEY
    client = OpenAI(
        base_url="https://openrouter.ai/api/v1",
        api_key=getenv("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"),
    )

    user_query = st.text_input("Enter your query")

    if st.button('Submit'):
        startTime = timeit.default_timer()
        completion = client.chat.completions.create(
            extra_headers={
                # "HTTP-Referer": $YOUR_SITE_URL, # Optional, for including your app on openrouter.ai rankings.
                # "X-Title": $YOUR_APP_NAME, # Optional. Shows in rankings on openrouter.ai.
            },
            model="anthropic/claude-3.5-sonnet",
            messages=[
                {
                    "role": "user",
                    "content": user_query,
                },
            ],
        )

        endTime = timeit.default_timer()
        st.write(completion.choices[0].message.content)
        st.write(f"\n\nQuery execution time: {endTime - startTime:.3f} s.")        

if __name__ == "__main__":
    main()