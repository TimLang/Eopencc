# Eopencc

**An Elixir erlport server of Ruby Ropencc which is a wapper for opencc**

## Usage

convert Simplified Chinese to Traditional Chinese

```elixir
Eopencc.Api.s2t("简体") #then return "簡體"
```
convert Traditional Chinese to Simplified Chinese

```elixir
Eopencc.Api.s2t("簡體") #then return "简体"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `eopencc` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:eopencc, "~> 0.1.0"}]
    end
    ```

  2. Ensure `eopencc` is started before your application:

    ```elixir
    def application do
      [applications: [:eopencc]]
    end
    ```

