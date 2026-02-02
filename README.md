# dotfiles

개인 개발 환경 설정 파일 모음

## 설치

```bash
git clone https://github.com/qudgus3822/dotfiles.git <원하는 경로>
cd <원하는 경로>
chmod +x install.sh
./install.sh
```

> `install.sh`는 스크립트가 위치한 경로를 자동으로 인식하므로, 어디에 클론해도 동작합니다.

## 포함된 설정

- `.claude/CLAUDE.md`: Claude Code 설정 파일
- `.zshrc`: zsh 설정 파일 (oh-my-zsh, pure prompt, nvm)
- `.gitconfig`: Git 설정 파일 (alias, 기본 설정)

## Git Alias

| Alias | 명령어 |
|-------|--------|
| `git st` | `git status` |
| `git co` | `git checkout` |
| `git br` | `git branch` |
| `git ci` | `git commit` |
| `git lg` | 그래프 형태 로그 (최근 20개) |
| `git last` | 마지막 커밋 확인 |
| `git unstage` | 스테이징 취소 |
| `git undo` | 마지막 커밋 취소 (변경사항 유지) |
