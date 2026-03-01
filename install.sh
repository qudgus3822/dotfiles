#!/bin/bash

# 스크립트가 위치한 디렉토리를 기준으로 경로 설정
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. NVM 설치 확인 및 설치
echo "NVM(Node Version Manager) 확인 중..."
export NVM_DIR="$HOME/.nvm"

if [ ! -d "$NVM_DIR" ]; then
    echo "  - NVM이 발견되지 않았습니다. 설치를 시작합니다..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # 현재 세션에서 바로 nvm을 사용하기 위해 로드
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
    echo "  - NVM이 이미 설치되어 있습니다."
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# 2. Node.js LTS 설치 및 Pure 테마 설치
echo "Node.js 및 Pure 테마 설정 중..."
nvm install --lts
nvm use --lts
npm install -g pure-prompt

# 3. 디렉토리 및 파일 정리
echo "디렉토리 및 환경 설정 중..."
mkdir -p ~/.claude
mkdir -p ~/.local/bin

# [중요] 기존에 폴더로 생성된 env가 있다면 삭제하고 파일로 생성
if [ -d "$HOME/.local/bin/env" ]; then
    rm -rf "$HOME/.local/bin/env"
fi
touch ~/.local/bin/env

# 4. 백업 함수
backup_if_exists() {
    local file=$1
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        cp "$file" "$file.backup"
        echo "  - 기존 파일 백업: $file.backup"
    fi
}

# 기존 파일 백업
echo ""
echo "기존 파일 백업 중..."
backup_if_exists ~/.claude/CLAUDE.md
backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig

# 5. 심볼릭 링크 생성 (dotfiles 저장소의 파일을 홈 디렉토리로 연결)
echo ""
echo "심볼릭 링크 생성 중..."
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✓ NVM & Node.js(LTS) 설치 완료"
echo "  ✓ Pure Prompt 테마 설치 완료 (NVM 경로)"
echo "  ✓ 모든 설정 파일(dotfiles) 연결 완료"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "설정을 적용하려면 터미널을 재시작하거나 'source ~/.zshrc'를 입력하세요!"