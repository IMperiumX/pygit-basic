# pygit-basic

A basic re-implementation of Git in Python. This project provides fundamental Git functionalities such as initializing a repository, adding files, committing changes, and viewing the commit history. It is designed as an educational tool to help understand the core concepts of Git.

## Table of Contents

- [pygit-basic](#pygit-basic)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)

## Introduction

**pygit-basic** is a simplified version of Git written in Python. It demonstrates how version control systems work by implementing key Git features. This project is perfect for those who want to learn about Git's inner workings or for educational purposes in a classroom setting.

## Features

- Initialize a new repository
- Add files to the staging area
- Commit changes with messages
- View commit history

## Installation

To use **pygit-basic**, you need to have Python installed on your machine. Follow these steps to set up the project:

1. Clone the repository:

    ```bash
   git clone https://github.com/yourusername/pygit-basic.git
   cd pygit-basic
    ```

2. (Optional) Create a virtual environment:

    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
    Install required dependencies (if any):
    ```

3. Install required dependencies (if any):

    `pip install -r requirements.txt`

## Usage

Here's a brief guide on how to use pygit-basic:

1. Initialize a Repository

   ```python
   from pygit_basic import init_repo
   init_repo('./my_repo')
   ```

2. Add Files:

   ```python
   from pygit_basic import add
   add('./my_repo', 'file1.txt')
   ```

3. Commit Changes:

   ```python
   from pygit_basic import commit
   commit('./my_repo', 'Initial commit')
   ```

4. View Commit History:

   ```python
   from pygit_basic import log
   log('./my_repo')
   ```
