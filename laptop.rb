dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "workstation"
end

dep "workstation" do
  requires "personal dotfiles"
end
