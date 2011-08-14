def compile(name)
  namespace "compile" do
  task name do
    sh "ghc -O2 --make #{name}"
  end
  end
end

def clean(name)
  files = [name] + FileList.new("*.hi", "*.o") 
  namespace "clean" do
  task name do
    rm files
  end
  end
end

def x(name)
  compile(name)
  clean(name)
end

x("Generator")
x("Solver")

task "compile" do
   ["Generator", "Solver"].map { |x| sh "ghc --make -O2 #{x}" } 
end


      
