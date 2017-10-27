function v = getoptions(options, name, v0)
   if isfield(options, 'entry')
       v = options.entry;
   else
       v = v0;
   end
end
