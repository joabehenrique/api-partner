# :deciduous_tree: API Partner

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/api-partner?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/api-partner?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/api-partner?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/api-partner?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/api-partner?style=flat)

> Project developed for a test of the Árvore, aiming to allow a partner to replicate its network structure.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir/Phoenix` and `PostgreSQL` on your machine.

If you need installation instructions, [click here](https://hexdocs.pm/phoenix/installation.html).

## 🚀 Installing API Partner

To install API Partner, follow these steps:

1º Clone the repository.

```
>  git clone https://github.com/joabehenrique/api-partner.git
```

2º Open the project in your vscode and run the command

```
> mix deps.get
```

3º Just run project

```
> mix phx.server
```

## ☕ Using API Partner

To use API Partner, follow these steps:

```
API Partner is a project where we used Phoenix
to manage a single entity,where in it the partner
could create its network structure,being able to
create an entity, update or search by id.

Ecto was used to persist the data in MySQL as well
as search within the database.
```

Getting a entity

```
(GET) api/v2/partners/entities/{id}
```

Creating a entity

```
(POST) api/v2/partners/entities

{
  "name": "Escola Exemplo",
  "entity_type": "school",
  "inep": "12345678",
  "parent_id": null
}
```

Changing a entity

```
(PUT) api/v1/user/{id}

{
  "name": "Escola Exemplo2",
  "entity_type": "class",
  "inep": "12345679",
  "parent_id": "1"
}
```

## 📫 Contributing to API Partner

To contribute to API Partner, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin API Partner / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/joabehenrique">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/api-partner/blob/master/CONTRIBUTING.md) and read how to contribute.

## 📝 License

This project is under license. See the [license](https://github.com/joabehenrique/api-partner/blob/master/LICENSE.md) file for more details.
