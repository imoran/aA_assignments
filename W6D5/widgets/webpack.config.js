module.exports = {
  entry: './frontend/widgets.jsx',
  output: {
    filename: './bundle.js',
  },

  devtool: 'source-map',
  module: {
    loaders: [
      {
        test:[/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
