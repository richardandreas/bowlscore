# Jobsity-Bowlinig-Score-Test

This project is part of the selection process for a programmer job. It reads bowling players pinfall count present in a text file, parses its content, and present it in a table layout ini the terminal.

## Setup

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

First, let's install the software needed to run this project (if you haven't yet). You'll be needing the following tools:

* RVM (or Ruby-2.7.1)

### Installing
Once having this repository on your local machine, install Ruby, preferably version 2.7.1 (if not already installed), by running this commando in RVM:
```shell
$ rvm install 2.7.1
```
Next let's install all the required packages. In the main applications folder, call bundler:
```shell
$ bundle install
```

## Running the App
In the main application folder, you can run the tests just to check if everything is working properly:
```shell
$ rspec
```
This application uses SimpleCov as a dependency, so by running the tests, a code coverage report should be generates on your computer. It's location is inside the <i>features</i> folder in the project main root.

Finally, run the app using this command:
```shell
$ FILE_PATH='<put path to file here>' ruby bin/bowlscore

# Example:

$ FILE_PATH='./spec/support/test-input-1.txt' ruby bin/bowlscore
$ FILE_PATH='./spec/support/test-input-2.txt' ruby bin/bowlscore
```
Try replacing whe file path with one that points to your own file.
