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

  def list_people
      if File.exist?('./data/people.json')
        file = File.read('./data/people.json')
        data_hash = JSON.parse(file)
        data_hash.each_with_index { |n, i|
          n.each do |key, value|
            if key != "className"
          print "#{key}: "
          print "#{value} ".yellow
            else
          print "[#{value}] ".green
            end
      end
      puts " "
    } else
          puts 'No members added yet!'.red
        end
  end

  def save_people
    f = File.new("./data/people.json", "w")
    jjn = @people.map { |p| 
      if p.class.name == "Student"
        {className: p.class.name, Name: p.name, ID: p.id, Age: p.age }
      else
        {className: p.class.name, Name: p.name, ID: p.id, Age: p.age }
      end}
    f.puts(jjn.to_json)
    f.close
  end
end
