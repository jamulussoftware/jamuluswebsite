---
layout: wiki
title: "JSON-RPC interface"
lang: "en"
permalink: "/wiki/JSON-RPC"
---

# JSON-RPC interface

A JSON-RPC interface is available for both Jamulus client and server to allow programmatic access. To use the JSON-RPC interface, run Jamulus with `--jsonrpcport <port>` option. This will start a JSON-RPC server on the specified port on the localhost.

## Wire protocol

The JSON-RPC server is based on the [JSON-RPC 2.0](https://www.jsonrpc.org/specification) protocol, using [streaming newline-delimited JSON over TCP](https://clue.engineering/2018/introducing-reactphp-ndjson) as the transport. There are three main types of messages being exchanged:

- A **request** from the consumer to Jamulus.
- A **response** from Jamulus to the consumer.
- A **notification** from Jamulus to the consumer.

## Example

After opening a TCP connection to the JSON-RPC server, the following **request** can be sent:

<!-- prettier-ignore-start -->

```json
{"id":1,"jsonrpc":"2.0","method":"jamulus/getMode","params":{}}
```

<!-- prettier-ignore-end -->

The request must be sent as a single line of JSON-encoded data, followed by a newline character. Jamulus will send back a **response** in the same manner:

<!-- prettier-ignore-start -->

```json
{"id":1,"jsonrpc":"2.0","result":{"mode":"client"}}
```

<!-- prettier-ignore-end -->

Jamulus will also send **notifications** to the consumer:

<!-- prettier-ignore-start -->

```json
{"jsonrpc":"2.0","method":"jamulusclient/chatTextReceived","params":{"text":"<font color=\"mediumblue\">(01:23:45 AM) <b>user</b></font> test"}}
```

<!-- prettier-ignore-end -->

---

> 🤔 Should I list all the methods in the documentation or should I just do this…?

## Available methods

To see what methods are available, take a look at these files:

- [`clientrpc.cpp`](https://github.com/dtinth/jamulus/blob/json-rpc/src/clientrpc.cpp)
- [`serverrpc.cpp`](https://github.com/dtinth/jamulus/blob/json-rpc/src/serverrpc.cpp)

For requests from the consumer to Jamulus, search for `pRpcServer->HandleMethod`.

For notifications from Jamulus to the consumer, search for `pRpcServer->BroadcastNotification`.

---

> 🤔 Here’s a draft list of all methods. But keeping them up to date may be a pain.

## Common methods

### `jamulus/getMode`

Returns the current Jamulus mode.

**Parameters:** None (empty object)

**Returns:**

| Member | Type   | Description                                         |
| ------ | ------ | --------------------------------------------------- |
| mode   | string | The current Jamulus mode (`"client"` or `"server"`) |

## Client methods

### `jamulusclient/getClientInfo`

Returns the status of the client.

**Parameters:** None (empty object)

**Returns:**

| Member    | Type    | Description                                    |
| --------- | ------- | ---------------------------------------------- |
| connected | boolean | Whether the client is connected to the server. |

### `jamulusclient/getChannelInfo`

Returns your profile information.

**Parameters:** None (empty object)

**Returns:**

| Member     | Type   | Description                                                               |
| ---------- | ------ | ------------------------------------------------------------------------- |
| name       | string | Your name.                                                                |
| skillLevel | string | Your skill level (`"beginner"`, `"intermediate"`, `"expert"`, or `null`). |

### `jamulusclient/getClientList`

Returns the list of musicians.

**Parameters:** None (empty object)

**Returns:**

| Member  | Type  | Description                      |
| ------- | ----- | -------------------------------- |
| clients | array | An array of clients (musicians). |

Each client is an object with the following members:

| Member       | Type   | Description                                                                    |
| ------------ | ------ | ------------------------------------------------------------------------------ |
| id           | number | The channel ID, assigned by Jamulus server.                                    |
| name         | string | The musician's name.                                                           |
| skillLevel   | string | The musician's skill level.                                                    |
| countryId    | number | The musician's [country ID](https://doc.qt.io/qt-5/qlocale.html#Country-enum). |
| city         | string | The musician's city.                                                           |
| instrumentId | number | The musician's instrument ID.                                                  |

### `jamulusclient/setName`

Sets your name in the profile.

**Parameters:**

| Member | Type   | Description   |
| ------ | ------ | ------------- |
| name   | string | The new name. |

**Returns:** A string `"ok"`.

### `jamulusclient/setSkillLevel`

Sets your skill level in the profile.

**Parameters:**

| Member     | Type   | Description                                                                  |
| ---------- | ------ | ---------------------------------------------------------------------------- |
| skillLevel | string | The new skill level (`"beginner"`, `"intermediate"`, `"expert"`, or `null`). |

**Returns:** A string `"ok"`.

### `jamulusclient/sendChatText`

Sends a chat text to the server.

**Parameters:**

| Member  | Type   | Description            |
| ------- | ------ | ---------------------- |
| message | string | The chat text to send. |

**Returns:** A string `"ok"`.

## Client notifications

### `jamulusclient/chatTextReceived`

Sent when HTML content for the chat room is received from the server.

**Parameters:**

| Member | Type   | Description                |
| ------ | ------ | -------------------------- |
| text   | string | The HTML that is received. |

### `jamulusclient/clientIDReceived`

Sent when the client ID has been assigned from the server.

**Parameters:**

| Member | Type   | Description      |
| ------ | ------ | ---------------- |
| id     | number | Your channel ID. |

### `jamulusclient/clientListReceived`

Sent when the list of musicians has been received from the server. This happens when people connects to or disconnects from the server.

**Parameters:**

| Member  | Type  | Description                      |
| ------- | ----- | -------------------------------- |
| clients | array | An array of clients (musicians). |

See `jamulusclient/getClientList` for the structure of each client.

### `jamulusclient/channelLevelListReceived`

Sent when the sound level of each musician has been received from the server.

**Parameters:**

| Member           | Type  | Description                 |
| ---------------- | ----- | --------------------------- |
| channelLevelList | array | An array of channel levels. |

Each channel level is an number from 0 to 8, each entry corresponding to respective musician list obtained from `jamulusclient/getClientList`.

### `jamulusclient/disconnected`

Sent when the client is disconnected from the server.

**Parameters:** None (empty object)
