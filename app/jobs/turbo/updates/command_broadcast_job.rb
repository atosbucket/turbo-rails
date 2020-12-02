# The job that powers all the <tt>broadcast_$command_later</tt> broadcasts available in <tt>Turbo::Updates::Broadcasts</tt>.
class Turbo::Updates::CommandBroadcastJob < ApplicationJob
  def perform(stream, command:, dom_id:, **rendering)
    Turbo::UpdatesChannel.broadcast_command_to stream, command: command, dom_id: dom_id, **rendering
  end
end
