"""
main.py — Entry point for the AdGuard VPN GUI application.

Run directly:
    python main.py

Build with PyInstaller (single file):
    pyinstaller --onefile --windowed --name adguard-vpn-gui main.py
"""

import tkinter as tk
from frontend import VpnApplicationWindow


def main():
    root = tk.Tk()
    application = VpnApplicationWindow(root)  # noqa: F841  (kept alive via root mainloop)
    root.mainloop()


if __name__ == "__main__":
    main()
