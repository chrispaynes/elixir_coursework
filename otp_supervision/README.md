# OtpSupervision

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `otp_supervision` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:otp_supervision, "~> 0.1.0"}]
    end
    ```

  2. Ensure `otp_supervision` is started before your application:

    ```elixir
    def application do
      [applications: [:otp_supervision]]
    end
    ```

