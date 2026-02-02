#!/bin/bash

# 스크립트가 위치한 디렉토리를 기준으로 경로 설정
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# .claude 디렉토리 생성 (없으면)
mkdir -p ~/.claude

# 백업 함수
backup_if_exists() {
    local file=$1
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        cp "$file" "$file.backup"
        echo "  - 기존 파일 백업: $file.backup"
    fi
}

# 기존 파일 백업
echo "기존 파일 백업 중..."
backup_if_exists ~/.claude/CLAUDE.md
backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig

# 심볼릭 링크 생성
echo ""
echo "심볼릭 링크 생성 중..."
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

echo ""
echo "✓ Claude Code 설정 완료"
echo "✓ zsh 설정 완료"
echo "✓ Git 설정 완료"
