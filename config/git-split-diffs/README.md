## Info

Using: https://github.com/banga/git-split-diffs/

```bash
# Install
npm install -g git-split-diffs

# Install (with mouse scrolling)
git config --global core.pager "git-split-diffs --color | less -+LFX"
```

## Custom Theme ([info](https://github.com/banga/git-split-diffs/tree/v2.2.0?tab=readme-ov-file#custom-themes))

Copy JSON themes to `~/.git-split-diffs-themes`, then:

```bash
git config --global split-diffs.theme-directory ~/.git-split-diffs-themes
git config --global split-diffs.theme-name transparent
```

