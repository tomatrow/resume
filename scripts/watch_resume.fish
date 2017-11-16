
function watch_resume
    set best_resume_ever_dir '/Users/ajcaldwell/src/best-resume-ever'
    set -l project_dir '/Users/ajcaldwell/Projects/resume'
    fswatch \
        -0 "$project_dir" \
        --exclude '.*\.lock' \
        --exclude '.*\.fish' \
        --include '.*\.vue' \
        --include '.*\.yml' \
        --include '.*\.jpg' \
        | xargs -0 -n 1 "$project_dir/scripts/sync_to_resume.fish"
end 