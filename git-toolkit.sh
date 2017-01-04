function me_git_cherrypick_from_remote() {
  while [[ "$#" > 1 ]]; do 
    case $1 in
      --dir_path) dir_path="$2";;
      --commit_sha) commit_sha="$2";;
      --new_author) new_author="$2";;
      *) break;;
    esac; shift; shift
  done

  git --git-dir=${dir_path}/.git format-patch -k -1 --stdout ${commit_sha}| git am -3 -k
  [ "${new_author:-}" != "" ] && git commit --amend --author "$new_author"
}
