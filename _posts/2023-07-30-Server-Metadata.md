---
layout: post
title: "Allow or block bots"
lang: "en"
heading: "Metadata for servers"
---

To provide information about Servers and specify policies for bots, a server owner can add metadata to their server welcome message. This page describes metadata a welcome message might include.

<!--more-->

You can add metadata to your server for many purposes. Adding contact information like the E-Mail or Website of the Server administrator helps users to contact the administrator if something goes wrong with the server. Also adding policies for bots allows them to judge if they can or cannot connect to the server.

## How to add metadata

Metadata should be added to the welcome message. If you are running a GUI server, paste the metadata into the welcome message box. Headless servers can use the `--welcomemessage` CLI argument to provide a path to a file containing the welcome message.

## Format of metadata

A metadata tag is a HTML comment that looks like this:

```html
<!-- META: <tagname> <value> -->
```

For example, to add a way to contact the server administrator, a tag could look like this:

```html
<!-- META: admincontact admin@example.com -->
```

You can modify and paste this into your welcome message.

See [this discussion](https://github.com/orgs/jamulussoftware/discussions/3086) for more information.

