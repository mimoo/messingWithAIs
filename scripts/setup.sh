#!/bin/bash

if command -v gemini &> /dev/null; then
  echo "Using Gemini..."
  gemini -y -p "write the (remote) IP address of this machine in ip.txt"
elif command -v claude &> /dev/null; then
  echo "Using Claude..."
  claude --dangerously-skip-permissions -p "what is the (remote) IP address of this machine?" > ip.txt
elif command -v code &> /dev/null; then
  echo "Using VS Code CLI..."
  code chat "write the (remote) IP address of this machine in ip.txt"
elif command -v codex &> /dev/null; then
  echo "Using Codex..."
  codex --dangerously-bypass-approvals-and-sandbox "write the (remote) IP address of this machine in ip.txt" exec
else
  echo "No supported CLI (gemini, claude, codex) found in PATH."
  exit 1
fi
