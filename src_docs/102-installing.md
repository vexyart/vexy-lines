# Download, Install, Activate

Vexy Lines is a 150 MB download that runs offline once activated. No account creation, no cloud services, no subscription. Here's how to get it onto your machine and ready to use.

## System Requirements

| Requirement | Minimum | Recommended |
|------------|---------|-------------|
| **macOS** | 12 (Monterey) or later | Latest release |
| **Windows** | 10 or later | 11 |
| **RAM** | 4 GB | 8 GB or more |
| **Disk space** | 300 MB free | 1 GB free (for working files) |
| **Display** | 1280 x 800 | 1920 x 1080 or larger |

Vexy Lines is a native application — it uses macOS and Windows system frameworks, not Electron or a browser wrapper. It runs well on both Intel and Apple Silicon Macs without Rosetta.

There's no GPU requirement. All rendering is CPU-based, so a faster processor with more cores will improve refresh times on complex documents, but even a five-year-old laptop handles typical projects comfortably.

## Downloading

Go to [vexy.art](https://vexy.art) and click the download button for your platform. You'll get:

- **macOS:** A `.dmg` disk image containing the application.
- **Windows:** A `.exe` installer.

The download is approximately **150 MB** on both platforms.

## Installing on macOS

1. Open the downloaded `.dmg` file. A window appears with the Vexy Lines icon and an Applications folder shortcut.
2. Drag the Vexy Lines icon into the Applications folder.
3. Eject the `.dmg` (right-click > Eject, or drag it to the Trash).
4. Open Vexy Lines from your Applications folder.

On first launch, macOS may warn you that the application was "downloaded from the internet." Click **Open** to confirm. This is standard macOS Gatekeeper behaviour for applications downloaded outside the App Store — Vexy Lines is properly signed and notarized.

If macOS refuses to open the app entirely, go to **System Settings > Privacy & Security**, scroll down, and click **Open Anyway** next to the Vexy Lines entry.

## Installing on Windows

1. Run the downloaded `.exe` installer.
2. Follow the installation wizard. The default location is `C:\Program Files\Vexy Lines\` — there's rarely a reason to change it.
3. Choose whether to create a desktop shortcut and Start Menu entry.
4. Click **Finish**.

Windows may show a SmartScreen prompt on first run. Click **More info**, then **Run anyway**. This happens because Vexy Lines is a niche application without millions of downloads — SmartScreen uses popularity as a trust signal.

## Activation

When you first launch Vexy Lines, you'll see an activation dialog. You have two options:

### Licensed Activation

1. Enter your **license key** — the code you received by email after purchasing from [vexy.art](https://vexy.art).
2. Click **Activate**.
3. Vexy Lines contacts the activation server briefly to validate your key. After this one-time check, the application works fully offline.

Your license covers **two computers**. You can use Vexy Lines on your desktop and your laptop, or on a Mac and a Windows machine — any combination. If you need to move your license to a new computer, deactivate it first on the old one (Help > Deactivate License), then activate on the new machine.

### Demo Mode

Click **Demo** (or **Try** / **Continue as Demo** depending on your version) to skip activation. Demo mode gives you access to every feature — all twelve fills, all tools, all parameters, all layer and group operations, mesh warping, everything. The only restriction: **you cannot export or copy to clipboard.**

This is a genuine try-before-you-buy experience. You can build a complete, complex document in demo mode and see exactly what the output would look like. When you're ready to export, enter your license key and your existing work is immediately exportable.

## The Intro Tour

On your very first launch, Vexy Lines shows a series of **yellow tooltip overlays** that point to key interface elements: the canvas, the toolbar, the Properties Panel, the Layers Panel, and the refresh controls. Each tooltip has a brief explanation and a **Next** button.

Read these — they take about sixty seconds and provide genuine orientation. But if you dismiss them early or want to see them again later, choose **Help > Intro Tour** from the menu bar to replay the sequence.

## Checking for Updates

Vexy Lines checks for updates automatically on launch (it needs an internet connection for this, obviously). When an update is available, you'll see a notification with the option to download and install it.

You can also check manually: **Help > Check for Updates**.

Updates are free for life. Your $99 license includes every future version.

## Purchasing a License

If you're running in demo mode and ready to buy:

1. Go to [vexy.art](https://vexy.art).
2. Click **Buy** and complete the purchase. The price is **$99 for a lifetime license** — no subscription, no renewal fees.
3. You'll receive a license key by email.
4. In Vexy Lines, go to **Help > Activate License** (or relaunch the application) and enter your key.

## Uninstalling

**macOS:** Drag Vexy Lines from your Applications folder to the Trash. Preferences are stored in `~/Library/Preferences/com.fontlab.vexy-lines.plist` — delete that file too if you want a completely clean removal.

**Windows:** Use **Settings > Apps > Installed apps**, find Vexy Lines, and click **Uninstall**. The uninstaller removes the application and its registry entries.

Neither platform leaves significant residual files behind.

## Troubleshooting Installation

| Problem | Solution |
|---------|----------|
| macOS says "app is damaged" | Re-download from [vexy.art](https://vexy.art). The file may have been corrupted during download. |
| macOS Gatekeeper blocks the app | System Settings > Privacy & Security > Open Anyway |
| Windows SmartScreen blocks the app | Click "More info" > "Run anyway" |
| Activation fails | Check your internet connection. Ensure the license key was copied correctly (watch for extra spaces). |
| "License already in use" | Deactivate on the other machine first, or contact [support](https://vexy.art/support). |
| App crashes on launch | Ensure your OS meets the minimum requirements. Try deleting preferences (see Uninstalling above) to reset to defaults. |

If none of these solve your problem, contact support through [vexy.art](https://vexy.art). Include your OS version, the exact error message, and your license key (if applicable).

## Next Steps

Vexy Lines is installed and activated. Before you open your first image, take two minutes to learn [the workspace](103-workspace.md) — where everything lives and what it does. Or, if you'd rather learn by doing, jump straight to [Your First Fill](106-first-fill.md).
