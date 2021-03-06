@moduledoc """
A schema is a keyword list which represents how to map, transform, and validate
configuration values parsed from the .conf file. The following is an explanation of
each key in the schema definition in order of appearance, and how to use them.

## Import

A list of application names (as atoms), which represent apps to load modules from
which you can then reference in your schema definition. This is how you import your
own custom Validator/Transform modules, or general utility modules for use in
validator/transform functions in the schema. For example, if you have an application
`:foo` which contains a custom Transform module, you would add it to your schema like so:

`[ import: [:foo], ..., transforms: ["myapp.some.setting": MyApp.SomeTransform]]`

## Extends

A list of application names (as atoms), which contain schemas that you want to extend
with this schema. By extending a schema, you effectively re-use definitions in the
extended schema. You may also override definitions from the extended schema by redefining them
in the extending schema. You use `:extends` like so:

`[ extends: [:foo], ... ]`

## Mappings

Mappings define how to interpret settings in the .conf when they are translated to
runtime configuration. They also define how the .conf will be generated, things like
documention, @see references, example values, etc.

See the moduledoc for `Conform.Schema.Mapping` for more details.

## Transforms

Transforms are custom functions which are executed to build the value which will be
stored at the path defined by the key. Transforms have access to the current config
state via the `Conform.Conf` module, and can use that to build complex configuration
from a combination of other config values.

See the moduledoc for `Conform.Schema.Transform` for more details and examples.

## Validators

Validators are simple functions which take two arguments, the value to be validated,
and arguments provided to the validator (used only by custom validators). A validator
checks the value, and returns `:ok` if it is valid, `{:warn, message}` if it is valid,
but should be brought to the users attention, or `{:error, message}` if it is invalid.

See the moduledoc for `Conform.Schema.Validator` for more details and examples.
"""
[
  extends: [],
  import: [],
  mappings: [
    "logger.console.format": [
      commented: false,
      datatype: :binary,
      default: """
      $time $metadata[$level] $message
      """,
      doc: "Provide documentation for logger.console.format here.",
      hidden: false,
      to: "logger.console.format"
    ],
    "logger.console.metadata": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        :request_id
      ],
      doc: "Provide documentation for logger.console.metadata here.",
      hidden: false,
      to: "logger.console.metadata"
    ],
    "logger.level": [
      commented: false,
      datatype: :atom,
      default: :info,
      doc: "Provide documentation for logger.level here.",
      hidden: false,
      to: "logger.level"
    ],
    "phoenix.serve_endpoints": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for phoenix.serve_endpoints here.",
      hidden: false,
      to: "phoenix.serve_endpoints"
    ],
    "shutdown_flag.flag_file": [
      commented: false,
      datatype: :binary,
      default: "/var/tmp/deploy/deploy-template/shutdown.flag",
      doc: "Provide documentation for shutdown_flag.flag_file here.",
      hidden: false,
      to: "shutdown_flag.flag_file"
    ],
    "shutdown_flag.check_delay": [
      commented: false,
      datatype: :integer,
      default: 10000,
      doc: "Provide documentation for shutdown_flag.check_delay here.",
      hidden: false,
      to: "shutdown_flag.check_delay"
    ],
    "deploy_template.ecto_repos": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        DeployTemplate.Repo
      ],
      doc: "Provide documentation for deploy_template.ecto_repos here.",
      hidden: false,
      to: "deploy_template.ecto_repos"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.secret_key_base": [
      commented: false,
      datatype: :binary,
      default: "30Jbu04r9eIXhYoFAHBAvHZAlXxr9jX00t18vfK+TfttLJeIdOTO3w68pSu8pcq3",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.secret_key_base here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.secret_key_base"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.view": [
      commented: false,
      datatype: :atom,
      default: DeployTemplateWeb.ErrorView,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.view here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.view"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.accepts": [
      commented: false,
      datatype: [
        list: :binary
      ],
      default: [
        "html",
        "json"
      ],
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.accepts here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.render_errors.accepts"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.name": [
      commented: false,
      datatype: :atom,
      default: DeployTemplate.PubSub,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.name here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.name"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.adapter": [
      commented: false,
      datatype: :atom,
      default: Phoenix.PubSub.PG2,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.adapter here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.pubsub.adapter"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.load_from_system_env": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.load_from_system_env here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.load_from_system_env"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.host": [
      commented: false,
      datatype: :binary,
      default: "example.com",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.host here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.host"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.port": [
      commented: false,
      datatype: :integer,
      default: 80,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.port here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.url.port"
    ],
    "deploy_template.Elixir.DeployTemplateWeb.Endpoint.cache_static_manifest": [
      commented: false,
      datatype: :binary,
      default: "priv/static/cache_manifest.json",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplateWeb.Endpoint.cache_static_manifest here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplateWeb.Endpoint.cache_static_manifest"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.adapter": [
      commented: false,
      datatype: :atom,
      default: Ecto.Adapters.Postgres,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.adapter here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.adapter"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.username": [
      commented: false,
      datatype: :binary,
      default: "postgres",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.username here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.username"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.password": [
      commented: false,
      datatype: :binary,
      default: "postgres",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.password here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.password"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.database": [
      commented: false,
      datatype: :binary,
      default: "deploy_template_prod",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.database here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.database"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.hostname": [
      commented: false,
      datatype: :binary,
      default: "localhost",
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.hostname here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.hostname"
    ],
    "deploy_template.Elixir.DeployTemplate.Repo.pool_size": [
      commented: false,
      datatype: :integer,
      default: 15,
      doc: "Provide documentation for deploy_template.Elixir.DeployTemplate.Repo.pool_size here.",
      hidden: false,
      to: "deploy_template.Elixir.DeployTemplate.Repo.pool_size"
    ]
  ],
  transforms: [],
  validators: []
]
