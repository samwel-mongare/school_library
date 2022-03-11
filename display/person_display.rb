class PersonDisplay
  include Instructions
  attr_accessor :people

  def initialize
    @people = []
  end

  def create_person
    selection = one_line_prompt('Do you want to create a student (1) or a teacher (2)? [input the number]: ').to_i

    unless [1, 2].include?(selection)
      puts 'ERROR: Invalid option. Select 1 or 2'
      return
    end

    age = one_line_prompt('Age: ').to_i
    name = one_line_prompt('Name: ')

    case selection
    when 1
      input = one_line_prompt('Has parent permission? [Yes/No]: ')
      permission = %w[Yes yes YES].include?(input)
      @people.push(Student.new(age, name, parent_permission: permission))
      save_people
      puts 'PERSON CREATED SUCCESSFULLY'.green
    when 2
      specialization = one_line_prompt('Specialization: ')
      @people.push(Teacher.new(age, specialization, name))
      save_people
      puts 'PERSON CREATED SUCCESSFULLY'.green
    end
  end

  def load_people
    return unless File.exist?('./data/people.json')

    file = File.read('./data/people.json')
    data_hash = JSON.parse(file)
    data_hash.map do |person|
      if person['className'] == 'Student'
        @people.push(Student.new(person['Age'], person['Name']))
      else
        @people.push(Teacher.new(person['Age'], person['specialization'], person['Name']))
      end
    end
  end

  def list_people
    if @people.length.positive?
      puts(@people.map { |p| "[#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}".yellow })
    else
      puts 'No library members yet!'.red
    end
  end
end
