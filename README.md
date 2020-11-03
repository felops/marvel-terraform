# Marvel Heroes
An awesome app that consumes the official [Marvel API](https://developer.marvel.com)!

<br>

## Demo
[<img src="https://img.shields.io/badge/MARVELFLIX-%23F0131E?logoColor=white&style=for-the-badge" />](https://marvelflix.felops.vercel.app)

<br>

## Technology
The infraestructure was built with IaC philosofy in mind, using terraform. The lambdas share a lambda layer that is stored in a S3 bucket named `marvel`, alongside a lambda template. It uses a DynamoDB table to store the heroes by movies as well.

<br>

## Structure
All the infraestructure for the API is in this repository. It uses API Gateway + Lambdas + DynamoDB. The project has 2 more repositories:
- [API Code](https://github.com/felops/marvel-api)
- [Frontend](https://github.com/felops/marvelflix)
