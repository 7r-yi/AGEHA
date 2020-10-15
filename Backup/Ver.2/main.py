import subprocess

if __name__ == '__main__':
    while True:
        output = subprocess.check_output('ruby main.rb')
        if "shutdown" in str(output):
            break
