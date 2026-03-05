# dotfiles

개인 개발 환경 설정 파일 모음

## 사전 요구사항

- [oh-my-zsh](https://ohmyz.sh/)
- oh-my-zsh 플러그인: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- [nvm](https://github.com/nvm-sh/nvm) + Node.js (pure-prompt 설치용)
- [pure-prompt](https://github.com/sindresorhus/pure) (nvm 경로에 설치)
- VSCode (`code` CLI)

## 설치

```bash
git clone https://github.com/qudgus3822/dotfiles.git <원하는 경로>
cd <원하는 경로>
chmod +x install.sh
./install.sh
```

> `install.sh`는 기존 파일을 `.backup`으로 백업한 뒤 **심볼릭 링크**를 생성합니다.
> 스크립트가 위치한 경로를 자동으로 인식하므로 어디에 클론해도 동작합니다.

## 포함된 설정

- `.claude/CLAUDE.md`: Claude Code 설정 파일
- `.zshrc`: zsh 설정 파일 (oh-my-zsh, pure prompt, nvm)
- `.gitconfig`: Git 설정 파일 (alias, 기본 설정)

## 주의사항

`.zshrc`에 포함된 `kython()` 함수는 `~/Source/kython/kython-backend` 경로를 사용합니다.
해당 프로젝트가 없는 환경에서는 이 함수를 삭제하거나 경로를 수정하세요.

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
