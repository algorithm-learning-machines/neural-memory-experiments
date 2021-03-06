locales = {'en_US.UTF-8'}
os.setlocale(locales[1])

require("torch")
require("rnn")
require("nn")
require("optim")

require("header")

require("tasks.all_tasks")
require("models.memory_model")


function CustomModel()
   local opt = {} 

   opt.memOnly = true
   opt.vectorSize = 5 
   opt.inputSize = 10 
   opt.separateValAddr = true 
   opt.noInput = false -- model receives input besides its memory 
   opt.noProb = true 
   opt.simplified = false 
   opt.supervised = false 
   opt.probabilityDiscount = 0.99
   opt.maxForwardSteps = 5
   opt.batchSize = 2
   opt.memorySize = 5
   opt.useCuda = false


   ---- model to train
   Model = require("models.memory_model")
   return Model.create(opt)
end


local opts = {}
opts.fixedLength = true

local tasks = allTasks()

for k,v in ipairs(tasks) do
   if v == "Copy" then
      local t = getTask(v)()
      
     
      local seqLSTM = nn.Sequencer(CustomModel())
      X = torch.randn(2,1,35)
      out = seqLSTM:forward(X)
      
   end
end
