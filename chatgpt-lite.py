import os
import time
from datetime import date

banner = """
⡎⠑ ⣇⡀ ⢀⣀ ⣰⡀ ⡎⠑ ⣏⡱ ⢹⠁   ⣀⡀ ⡀⢀   ⡇  ⠄ ⣰⡀ ⢀⡀
⠣⠔ ⠇⠸ ⠣⠼ ⠘⠤ ⠣⠝ ⠇  ⠸  ⠶ ⡧⠜ ⣑⡺   ⠧⠤ ⠇ ⠘⠤ ⠣⠭
"""

def main():
    os.system("clear")
    print(banner)
    openai.api_key = "YOUR_API_KEY"

    while True:
        query = input("@You > ")

        if query == "cls":
            os.system("clear")
        elif query == "reset":
            os.system("reset")
            main()
        elif query == "time":
            current_time = time.strftime("%H:%M")
            print(f"\nCurrent time: {current_time}\n")
        elif query == "date":
            today = date.today()
            d1 = today.strftime("%B %d, %Y")
            print(f"\nCurrent Date: {d1}\n")
        elif query == ""
        else:
            response = openai.Completion.create(
                model="text-davinci-003",
                prompt=f"{query}",
                temperature=1,
                max_tokens=3500,
                top_p=1,
                frequency_penalty=0.2,
                presence_penalty=0
            )
            print("\n@ChatGPT > ")
            print(response["choices"][0]["text"])
            print()

if __name__=="__main__":
    try:
        import openai
    except ImportError:
        os.system("python3 -m pip install openai")
        import openai

    main()
