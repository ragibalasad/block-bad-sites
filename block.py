import platform


def get_hosts_path() -> str:
    return (
        "/etc/hosts"
        if platform.system() == "Linux"
        else r"C:\Windows\System32\drivers\etc\hosts"
    )


def read_domains(filename: str) -> list[str]:
    with open(filename, "r") as f:
        return f.read().split()


def block_sites(sites: list[str], hosts_path: str, ip: str = "127.0.0.1"):
    with open(hosts_path, "a") as f:
        for site in sites:
            print(f"Blocking {site}")
            f.write(f"\n{ip} {site}")
    print(f"Successfully Blocked {len(sites)} site(s)!")


def main():
    print("Block Thousands of Popular P*rn Sites from your device with just one click.")
    confirm = input("Are you sure you want to proceed?? - [Y/n] ").strip().lower()
    if confirm.lower() != "y":
        return

    print(
        "Note: You'll never be able to unblock these sites from this device unless you're a nerd."
    )
    input("Hit ENTER ")

    hosts_path = get_hosts_path()
    sites = read_domains("list.txt")
    block_sites(sites, hosts_path)


if __name__ == "__main__":
    main()
