<h1 align="center">
  <br>
  <a href="https://github.com/mkdirlove/chatgpt-lite"><img src="https://github.com/mkdirlove/chatgpt-lite/blob/main/logo.png" alt="chatgpt-lite"></a>
  <br>
  Yet another tool that uses the OpenAI API so that you can use ChatGPT in your Terminal..
  <br>
</h1>

#### Installation and Usage:

Copy-paste this into your terminal:

```sh
git clone https://github.com/mkdirlove/chatgpt-lite.git
```
```
cd chatgpt-lite
```
```
bash chatgpt-lite.sh
```
or
```
python3 chatgpt-lite.py
```
### Then edit file to match your config

If you don't have an API key, you can create at https://beta.openai.com/account/api-keys

```python
# Open chatgpt-lite.py on any code editor and go to line 13 then put your API key.
def main():
    os.system("clear")
    print(banner)
    openai.api_key = "YOUR_API_KEY"

```
```sh
# Open chatgpt-lite.sh on any code editor and go to line 4 then put your API key.
API_KEY=${1:-"YOUR_API_KEY"}
```
