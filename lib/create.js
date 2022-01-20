const prompt = require('prompt');
const shell = require('shelljs');
const fs = require('fs');
const colors = require("colors/safe");
const nodeCLI = require("shelljs-nodecli");

// Set prompt as green
prompt.message = colors.green("Replace");

/*
 * Command function
 */

module.exports = (args, options, logger) => {
  const name = args.name || 'some_app';
  const variant = options.variant || 'default';
  const templatePath = `${__dirname}/../templates/mf/${variant}`;
  const localPath = process.cwd();

  /*
   * Copy Template
   */

  if (fs.existsSync(templatePath)) {
    logger.info('Copying files…');
    shell.cp('-R', `${templatePath}/*`, localPath);
    logger.info('✔ The files have been copied!');
  } else {
    logger.error(`The requested template for mf wasn’t found.`)
    process.exit(1);

    
  }

  const ROOT_DIR = `./`;
  var FIND_STR = '[FILE_PREFIX]';        // <-- String to find
  var REPLACE_STR = name;       // <-- Replacement string

  var issues = [];

  // 1. Obtain all paths in the root directory.
  shell.find(ROOT_DIR)

    // 2. Exclude:
    //    - hidden files/folders (i.e. assets names starting with a dot)
    //    - Assets (i.e. at the end of the path) that do not contain `FIND_STR`
    .filter(function(_path) {
      var isVisible = _path.split('/').pop().indexOf('.', 0) !== 0,
        assetHasFindStr = _path.split('/').pop().indexOf(FIND_STR) > -1;
      return (assetHasFindStr && isVisible);
    })

    // 3. Sort paths by its depth in descending order.
    .sort(function(a, b) {
      return (b.split('/') || []).length - (a.split('/') || []).length;
    })

    // 4. Replace last instance of string to find with replace string and rename.
    .forEach(function (_path) {
      var firstPart = _path.substring(0, _path.lastIndexOf(FIND_STR)),
        lastPart = _path.substring(_path.lastIndexOf(FIND_STR, _path.length)),
        newPath = firstPart + lastPart.replace(FIND_STR, REPLACE_STR);

      // Only rename if `newPath` is not already taken otherwise log them.
      if (!shell.test('-e', newPath)) {
        shell.mv(_path, newPath);
      } else {
        issues.push(_path + ' --> ' + newPath);
      }
    });

  // 5. Log any paths that were not renamed because its name is already taken.
  if (issues.length) {
    shell.echo(issues.length + ' path(s) not renamed. Name is already taken:');
    issues.forEach(function(issue) {
      shell.echo('+ ' + issue);
    });
  }



  /*
   * File variables
   */

  const variables = require(`${templatePath}/_variables`);
  

  // Remove variables file from the current directory
  // since it only is needed on the template directory
  if (fs.existsSync(`${localPath}/_variables.js`)) {
    shell.rm(`${localPath}/_variables.js`);
  }
  
  logger.info('Please fill the following values…');

  console.log(capitalize(name));



  const file_prefix = 'file_prefix';
  const name_prefix = 'name';

    // Replace variable values in all files
    shell.ls('-Rl', '.').forEach(entry => {
      if (entry.isFile()) {
        shell.sed('-i', `\\[${file_prefix.toUpperCase()}\\]`, name, entry.name);
        shell.sed('-i', `\\[${name_prefix.toUpperCase()}\\]`, camelCaseModuleName(name), entry.name);
      }
    });


    logger.info('✔ Success!');
  
}

function capitalize(word) {
  return word
    .toLowerCase()
    .replace(/\w/, firstLetter => firstLetter.toUpperCase());
}

function camelCaseModuleName(str) {
  var i, frags = str.split('_');
  for (i=0; i<frags.length; i++) {
    frags[i] = frags[i].charAt(0).toUpperCase() + frags[i].slice(1);
  }
  return frags.join('');
}