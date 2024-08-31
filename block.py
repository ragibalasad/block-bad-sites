import platform
OS = platform.system()
HOST = "127.0.0.1"
HOSTS_PATH = "/etc/hosts" if OS == 'Linux' else r"C:\Windows\System32\drivers\etc\hosts"

print("Block Thousands of Popular P*rn Sites from your device with just one click.")
confirm = input("Are you sure you want to proceed?? - [Y/n]")
if confirm != "Y":
    exit()
else:
    print("Note: You'll never be able to unblock these sites from this device unless you're a nerd.")
    input("Hit ENTER ")

with open("list.txt") as f:
    haram_list = f.read()
    haram_list = haram_list.split()

    with open(HOSTS_PATH, "a") as f:
        for i in haram_list:
            print(f"Blocking {i}")
            f.write(f"\n{HOST} {i}")
            print("Done!")

    print(f"Succesfully Blocked {len(haram_list)} site(s)!")
