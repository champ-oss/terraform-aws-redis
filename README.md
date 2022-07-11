# terraform-aws-redis

Summary: terraform module for aws redis

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Terraform Input](#terraform)
* [Usage](#usage)
* [Project Status](#project-status)

## General Information
- deploy several resources to support aws redis

## Technologies Used
- terraform
- github actions

## Features

* deploy redis to given subnet group
* security group created for ingress connection
* at rest encryption enabled
* transit encryption enabled
* automatic failover enabled
* auth_token generated for redis password

## terraform

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

## Usage

* look at examples/complete/main.tf for usage

## Project Status
Project is: _in_progress_ 