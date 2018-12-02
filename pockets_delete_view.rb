class PocketsDeleteView
  def initialize(session_object)
    @actual_session = session_object
  end

  def text
    ['BORRAR UN BOLSILLO',
     'Escriba el nombre del bolsillo que desea borrar y presione enter']
  end

  def get_next_view
    pocket_name = gets.chomp.to_s
    pocket_manager = PocketsManager.new(@actual_session)
    pocket_manager.delete_pocket(pocket_name)
    PocketsView.new(@actual_session)
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end
end