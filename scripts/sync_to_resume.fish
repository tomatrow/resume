#! /usr/local/bin/fish

set -l project_dir '/Users/ajcaldwell/Projects/resume'
set -l best_resume_ever_dir '/Users/ajcaldwell/src/best-resume-ever'

function resume.sync -a source_file dest_file
    echo "$source_file -> $dest_file"
    rsync "$source_file" "$dest_file"
end

function resume.dest --inherit-variable best_resume_ever_dir -a dest_path source_file 
    echo "$best_resume_ever_dir/$dest_path/"(basename $source_file)
end
 
begin
    set -l changed_file "$argv" 

    switch "$changed_file"
    case "$project_dir/vue-components/*.vue"
        resume.sync "$changed_file" (resume.dest 'src/resumes' "$changed_file")
    case "$project_dir/data/data.yml"
        resume.sync "$changed_file" (resume.dest 'resume' "$changed_file")
    case "$project_dir/assets/*.jpg"
        resume.sync "$changed_file" (resume.dest 'resume' "$changed_file")
    case "$project_dir/data/general_data.yml"
        source "$project_dir/scripts/tailor_data.fish"
        e "$project_dir/data/tailored_data" --sort modified | tail -n 1 | read last_tailored_file
        tailor_data "$last_tailored_file"
    case "$project_dir/data/tailored_data/*.yml"
        source "$project_dir/scripts/tailor_data.fish"
        tailor_data "$changed_file"
    case '*'
        echo "Don't care about: $changed_file"
    end 
end


