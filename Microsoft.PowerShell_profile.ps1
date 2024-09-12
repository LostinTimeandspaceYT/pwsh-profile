oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/dracula.omp.json" | Invoke-Expression

function fuzzy_find {
    fzf --preview 'bat --color=always --line-range :500 {}'
}


function disk_usage {
gci . | 
  %{$f=$_; gci -r $_.FullName | 
    measure-object -property length -sum |
    select  @{Name="Name"; Expression={$f}}, 
            @{Name="Sum (MB)"; 
            Expression={"{0:N3}" -f ($_.sum / 1MB) }}, Sum } |
  sort Sum -desc |
  format-table -Property Name,"Sum (MB)", Sum -autosize
} 

function ls_fancy {
  lsd -l
}

function ls_tree {
  lsd --tree
}

function ls_a {
  lsd -la
}

# Personal Aliases
Set-Alias fzy fuzzy_find
Set-Alias du disk_usage
Set-Alias lt ls_tree 
Set-Alias la ls_a 
Set-Alias -Name ls -Value lsd -Option AllScope
