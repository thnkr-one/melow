# melow

This is a Rails 8.0 app.

## Prerequisites

This project requires:

- Ruby (see [.ruby-version](./.ruby-version)), preferably managed using [rbenv](https://github.com/rbenv/rbenv)
- PostgreSQL must be installed and accepting connections

On macOS, these [Homebrew](http://brew.sh) packages are recommended:

```
brew install rbenv
brew install postgresql@16
```

## Getting started

### bin/setup

Run this script to install necessary dependencies and prepare the Rails app to be started for the first time.

```
bin/setup
```

> [!TIP]
> The `bin/setup` script is idempotent and is designed to be run often. You should run it every time you pull code that introduces new dependencies or makes other significant changes to the project.

### Run the app!

Start the Rails server with this command:

```
bin/dev
```

The app will be located at <http://localhost:3000/>.

## Development

Use this command to run the full suite of automated tests:

```
bin/rake
```

```bash
+----------------------+--------+--------+---------+---------+-----+-------+
| Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
+----------------------+--------+--------+---------+---------+-----+-------+
| Controllers          |   1402 |   1094 |      35 |     183 |   5 |     3 |
| Helpers              |    675 |    557 |       1 |      72 |  72 |     5 |
| Jobs                 |     59 |     44 |       5 |       5 |   1 |     6 |
| Models               |   3976 |   3162 |      73 |     395 |   5 |     6 |
| Mailers              |      4 |      4 |       1 |       0 |   0 |     0 |
| Views                |   7029 |   6269 |       0 |       1 |   0 |  6267 |
| Stylesheets          |    147 |    116 |       0 |       0 |   0 |     0 |
| JavaScript           |   2121 |   1784 |       0 |       1 |   0 |  1782 |
| Libraries            |    371 |    304 |       5 |      26 |   5 |     9 |
| Controller tests     |   1767 |   1434 |      35 |     128 |   3 |     9 |
| Helper tests         |     33 |     28 |       1 |       5 |   5 |     3 |
| Job tests            |     45 |     23 |       6 |       1 |   0 |    21 |
| Model tests          |   1948 |   1440 |      43 |     156 |   3 |     7 |
| Mailer tests         |     10 |      5 |       2 |       0 |   0 |     0 |
| Channel tests        |     13 |      5 |       1 |       0 |   0 |     0 |
| Integration tests    |      0 |      0 |       0 |       0 |   0 |     0 |
| System tests         |    719 |    530 |       7 |      45 |   6 |     9 |
+----------------------+--------+--------+---------+---------+-----+-------+
| Total                |  20319 |  16799 |     215 |    1018 |   4 |    14 |
+----------------------+--------+--------+---------+---------+-----+-------+
  Code LOC: 13334     Test LOC: 3465     Code to Test Ratio: 1:0.3


```