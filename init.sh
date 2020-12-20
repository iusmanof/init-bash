RED='\033[0;31m'
GREEN='\033[0:32m'
YELLOW='\033[1:33m'
NC='\033[0m' # No Color

mkdir src;
mkdir dist;

chmod 777 dist;
chmod 777 src;

touch webpack.config.js .gitignore package.json;

cat > README.MD<<EOF
# _________ FILL IN _________
_________ FILL IN _________ what i do ?

[_________ FILL IN _________-link](https://iusmanof.github.io/_________ FILL IN _________/)
EOF

cat > webpack.config.js<<EOF
const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin');
const {
    CleanWebpackPlugin
} = require('clean-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyPlugin = require("copy-webpack-plugin");
const HtmlMinimizerPlugin = require("html-minimizer-webpack-plugin");
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = {
    mode: 'development',
    entry: './src/index.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        publicPath: '',
        // filename: '[name].[contenthash].js', // default: main.js
    
    },
    devtool: 'inline-source-map', // readable src code in dist/
    devServer: {
        contentBase: path.join(__dirname, 'dist'),
        port:5001,
        watchContentBase: true,
        open: true
    },
    module: {
        rules: [{
                test: /\.css$/i,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader",
                    {
                        loader: "postcss-loader",
                        options: {
                            postcssOptions: {
                                plugins: [
                                    [
                                        require('autoprefixer')
                                    ],
                                ],
                            },
                        },
                    },
                ],
            },
            {
                test: /\.js$/,
                loader: 'babel-loader',
            },
            {
                test: /\.s[ac]ss$/i,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader",
                    {
                        loader: "postcss-loader",
                        options: {
                            postcssOptions: {
                                plugins: [
                                    [
                                        require('autoprefixer')
                                    ],
                                ],
                            },
                        },
                    },
                    "sass-loader",
                ],
            },
            {
                test: /\.(png|jpe?g|gif)$/i,
                loader: 'file-loader',
                options: {
                  outputPath: 'assets',
                  name: '[name].[ext]'
                },
               
            },
            {
                test: /\.svg$/i,
                use: [
                  {
                    loader: 'url-loader',
                    options: {
                      encoding: false,
                    },
                  },
                ],
              }
        ],
    },
    plugins: [
        new CopyPlugin({
            patterns: [
                {
                    from: path.resolve(__dirname, 'src/assets'),
                    to: path.resolve(__dirname, 'dist/assets')
                },
                // {
                //     from: path.resolve(__dirname, 'src/assets/img'),
                //     to: path.resolve(__dirname, 'dist/assets/img')
                // },
            ],
        }),
        new MiniCssExtractPlugin({
           // filename: "[name].[contenthash].css"
           filename: 'style.css'
        }),
        new CleanWebpackPlugin({
            cleanStaleWebpackAssets: false
        }),
        new HtmlWebpackPlugin({
            title: 'Web Dev',
            template: './src/index.html',
        }),
    ],
    optimization: {
        minimize: true,
        minimizer: [
            new HtmlMinimizerPlugin(),
            new CssMinimizerPlugin({
                minimizerOptions: {
                    preset: [
                      'default',
                      {
                        discardComments: { removeAll: false },
                      },
                    ],
                  },
            }),
        ],
    },
};
EOF

cat > .gitignore <<EOF
node_modules/
package-lock.json
EOF

cat > package.json<<EOF
{
  "name": "_________ FILL IN _________",
  "version": "1.0.0",
  "description": "_________ FILL IN _________",
  "main": "index.js",
  "private": true,
  "browserslist": [
    "> .5%"
  ],
  "scripts": {
    "dev": "webpack --mode development",
    "build": "webpack --mode production",
    "watch": "webpack --mode development --watch",
    "start": "webpack serve --mode development",
    "server": "node server.js"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/iusmanof/_________ FILL IN _________.git"
  },
  "keywords": [
    "js",
    "css",
    "html",
	"_________ FILL IN _________"
  ],
  "author": "I.Usmanov <iusmanof@gmail.com>",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/iusmanof/_________ FILL IN _________/issues"
  },
  "homepage": "https://github.com/iusmanof/_________ FILL IN _________#readme",
  "devDependencies": {
    "@babel/core": "^7.12.9",
    "@babel/preset-env": "^7.12.7",
    "babel-loader": "^8.2.2",
    "clean-webpack-plugin": "^3.0.0",
    "copy-webpack-plugin": "^6.3.2",
    "css-loader": "^5.0.1",
    "css-minimizer-webpack-plugin": "^1.1.5",
    "file-loader": "^6.2.0",
    "html-minimizer-webpack-plugin": "^2.0.0",
    "html-webpack-plugin": "^4.5.0",
    "mini-css-extract-plugin": "^1.3.1",
    "postcss": "^8.1.10",
    "postcss-loader": "^4.1.0",
    "prettier": "2.2.1",
    "sass": "^1.29.0",
    "sass-loader": "^10.1.0",
    "style-loader": "^2.0.0",
    "url-loader": "^4.1.1",
    "webpack": "^5.9.0",
    "webpack-cli": "^4.2.0",
    "webpack-dev-server": "^3.11.0"
  },
  "dependencies": {
    "autoprefixer": "^10.0.4",
    "lodash": "^4.17.20",
    "normalize": "^0.3.1",
    "normalize.css": "^8.0.1",
    "postcss-cli": "^8.3.0"
  }
}
EOF

cd src;
mkdir assets;
touch index.html index.js style.sass reset.css test.js;

cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
EOF



cat > reset.css <<EOF 
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100\%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

a:link{
	text-decoration: none;
    color: white;
}
EOF

cat > index.js <<EOF
import 'normalize.css'
import './style.sass'
import * as Test from '../src/test'

Test.main();
EOF

cat > test.js<<EOF
function main(){
	console.log("test ...");
}
export {
    main
};
EOF

echo -e "\n\e[93mIn package.json rewrite _____ FILL IN _____ \n"
echo -e "In README.MD rewrite _____ FILL IN _____ \n"
echo -e "\e[92mInit is done \e[39m"




