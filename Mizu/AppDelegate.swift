//
//  AppDelegate.swift
//  Mizu
//
//  Created by Arun Sasidharan on 17/12/19.
//  Copyright © 2019 Fuzzy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
	let popover = NSPopover()

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		initStatusBar()
		initMenu()
		initPopover()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	private func initStatusBar() {
		if let button = statusItem.button {
			button.image = NSImage(named:NSImage.Name("StatusBarImage"))
			button.action = #selector(statusBarIconClicked)
		}
	}

	@objc private func statusBarIconClicked() {
		debugPrint("icon clicked")
	}

	private func initMenu() {
		let menu = NSMenu()

		menu.addItem(NSMenuItem(title: "Preferences", action: #selector(preferencesClicked(_:)), keyEquivalent: ""))
		menu.addItem(NSMenuItem.separator())
		menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: ""))

		statusItem.menu = menu
	}

	private func initPopover() {
		popover.contentViewController = PreferencesViewController.newInstance()
	}

	@objc private func preferencesClicked(_ sender: Any?) {
		if popover.isShown {
			closePopover(sender)
		} else {
			showPopover()
		}
	}

	func showPopover() {
		if let button = statusItem.button {
			popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
		}
	}

	func closePopover(_ sender: Any?) {
		popover.performClose(sender)
	}

}

