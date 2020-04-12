
\NeedsTeXFormat{LaTeX2e}
 
 
\newif\if@gmcm@bwprint\@gmcm@bwprintfalse
\newif\if@gmcm@preface\@gmcm@prefacetrue
 
\newcommand\gmcm@tokens@keywords{}
\newcommand*\gmcm@tokens@tihao{}
\newcommand*\gmcm@tokens@baominghao{}
\newcommand*\gmcm@tokens@schoolname{}
\newcommand*\gmcm@tokens@membera{}
\newcommand*\gmcm@tokens@memberb{}
\newcommand*\gmcm@tokens@memberc{}
\newcommand*\gmcm@tokens@supervisor{}
\newcommand*\gmcm@tokens@yearinput{}
\newcommand*\gmcm@tokens@monthinput{}
\newcommand*\gmcm@tokens@dayinput{}
 
 
\DeclareOption{colorprint}{\@gmcm@bwprintfalse}
\DeclareOption{bwprint}{\@gmcm@bwprinttrue}
\DeclareOption{withoutpreface}{\@gmcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
 
\ExecuteOptions{colorprint}
\ProcessOptions\relax
 
\LoadClass[a4paper,10pt]{ctexart}
 
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
	Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
 
 
 
%---------------------导入必要的宏包----------------------------------------
% 数学宏包
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\let\proof\relax
\let\endproof\relax
\RequirePackage{bm}
\RequirePackage{mathtools} % 解决amsmath的bug
\RequirePackage{physics} % 更简单的输入数学符号
\RequirePackage{txfonts} % 更多的数学符号
\RequirePackage{autobreak} % 数学公式自动断行
\RequirePackage{textcomp} % 听说很有用的包
\RequirePackage{fontspec}

% 设置颜色
%\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
\RequirePackage{subfig} % 图片并排放置
% 表格
\RequirePackage{float,tabularx,array}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}


 
% 首行缩进
\RequirePackage{indentfirst}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}
% 下划线 
\RequirePackage{ulem}
%下划线宏包用法和样式如下：
%\uuline{双下划线}
%\uwave{波浪线}
%\sout{中间删除线}
%\xout{斜删除线}
%\dashuline{虚线}
%\dotuline{加点}

% 尺寸计算
\RequirePackage{calc}
\RequirePackage{titletoc,url}
%参考文献
\RequirePackage[super]{gbt7714}
 
\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
	\phantomsection
	\addcontentsline{toc}{section}{\refname}
}
% 超链接 hyperref 的设置
\RequirePackage{hyperref}

% 特殊符号
\RequirePackage{times}
\RequirePackage{mathptmx}
\RequirePackage{bbding}
\RequirePackage{wasysym}

% 可变长箭头
\RequirePackage{extarrows}
%---------------------导入必要的宏包----------------------------------------
 
 
 
 
%---------------设置latex中插入的程序代码格式----------------------------------------
% 1.导入代码样式宏包 ，选择 minted 引擎
\RequirePackage[dvipsnames, svgnames]{xcolor}
\RequirePackage[minted]{tcolorbox}
\tcbuselibrary{skins, listings, xparse, breakable}
 
\RequirePackage{varwidth}
% 设置代码框样式
\tcbset{skin=enhanced,
lang/.style={
	breakable,drop shadow,
	listing engine=minted,
	minted style=colorful,
	minted options={breaklines,fontsize=\small,linenos,autogobble, numbersep=3mm},
	colback=blue!5!white,colframe=blue!75!black,
	left=6mm,enhanced,title={#1},
	colframe=tcbcolback!60!black,colback=tcbcolback!30!white,colbacktitle=tcbcolback!5!yellow!10!white,
	fonttitle=\bfseries,coltitle=black,attach boxed title to top center=
	{yshift=-0.25mm-\tcboxedtitleheight/2,yshifttext=2mm-\tcboxedtitleheight/2},
	attach boxed title to top left={xshift=1cm,yshift*=1mm-\tcboxedtitleheight},
	varwidth boxed title*=-3cm,
	boxed title style={frame code={
			\path[fill=tcbcolback!30!black]
			([yshift=-1mm,xshift=-1mm]frame.north west)
			arc[start angle=0,end angle=180,radius=1mm]
			([yshift=-1mm,xshift=1mm]frame.north east)
			arc[start angle=180,end angle=0,radius=1mm];
			\path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
			middle color=tcbcolback!80!black]
			([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
			[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
			-- (frame.south east) -- (frame.south west)
			-- ([xshift=-1mm,yshift=-1mm]frame.north west)
			[sharp corners]-- cycle;
		},interior engine=empty,
	},
	overlay={\begin{tcbclipinterior}\fill[tcbcolback!80!black] (frame.south west)
			rectangle ([xshift=5mm]frame.north west);\end{tcbclipinterior}}
}}
% 导入语法高亮
\DeclareTCBListing{code}{ m m }{%
	listing only,
	lang,
	minted language={#1},% 选择语言
	title={#2}}

% 导入多带底部注释的语法框
\DeclareTCBListing{mycode}{ m m m }{%
	listing and comment,
	colbacklower=tcbcolback!5!yellow!10!white,
	collower=tcbcolback!60!black,
	lang,
	title={#2},
	comment={\small\sffamily#3},
	minter language={#1}} %选择语言


%2.使用listings宏包，此处只使用其行内代码功能。

% 导入行内代码宏包
\RequirePackage{listings}
%先自定义三种颜色
%\definecolor{dkgreen}{rgb}{0,0.6,0}
%\definecolor{gray}{rgb}{0.5,0.5,0.5}
%\definecolor{mauve}{rgb}{0.58,0,0.82}
%设置lstset环境
%\lstset{
%	frame=tb,
%	aboveskip=3mm,
%	belowskip=3mm,
%	showstringspaces=false,
%	columns=flexible,
%	framerule=1pt,
%	rulecolor=\color{gray!35},
%	backgroundcolor=\color{gray!5},
%	basicstyle={\small\ttfamily},
%	numbers=left,
%	numberstyle=\tiny\color{gray},
%	commentstyle=\color{dkgreen},
%	stringstyle=\color{mauve},
%	breaklines=true,
%	breakatwhitespace=true,
%	tabsize=3,
%}
%---------------设置latex中插入的程序代码格式---------------------------------------


%---------------设置latex中的颜色---------------------------------------

%先自定义几种颜色
\definecolor{f8766d}{HTML}{ff9f1a}
\definecolor{1a9850}{HTML}{0097e6}
\definecolor{ffa725}{HTML}{1289A7}
\definecolor{2a7ae2}{HTML}{7158e2}
\definecolor{6a3d9a}{HTML}{ED4C67}
\definecolor{53a9ab}{HTML}{487eb0}
\definecolor{titlepurple}{HTML}{5758BB}
\definecolor{titlepurpleb}{HTML}{833471}
\definecolor{titlepurplec}{HTML}{006266}
\definecolor{md}{HTML}{EA2027}

%geogebra颜色
\definecolor{zzttqq}{rgb}{0.6,0.2,0}
\definecolor{uuuuuu}{rgb}{0.26666666666666666,0.26666666666666666,0.26666666666666666}
\definecolor{ududff}{rgb}{0.30196078431372547,0.30196078431372547,1}
\definecolor{xdxdff}{rgb}{0.49019607843137253,0.49019607843137253,1}

%---------------设置latex中的颜色---------------------------------------
 
%-----------------------设置页面布局-------------------------------------
% 导入页面布局的宏包
\RequirePackage{geometry}
\geometry{top=30.0mm,bottom=25.0mm,left=35.7mm,right=31.7mm,headsep=8mm}
% 利用宏包 geometry设置上、下、左、右的页边距以及标题和正文之间的间距
 
\renewcommand*{\baselinestretch}{1.4}
% 将行间距调整为1.4倍行距
%-----------------------设置页面布局-------------------------------------
 
 
 
%----------------------设置首行缩进------------------------------
% 导入首行缩进用的宏包
\RequirePackage{indentfirst}	
% 每行缩进两个汉字
\setlength{\parindent}{2em}
%----------------------设置首行缩进------------------------------
 
%------------------------浮动环境设置-----------------------------------------------------------
 
% 下面给出的命令用来控制一页中有多大比例的区域可用来放置浮动对象
% (这里的比例是指浮动对象的高度除以正文高度\textheight)。
% 前面三个命令只作用于文本页，而最后一个命令只作用于浮动页。这些命令的值可以用 \renewcommand 来修改。
% (1) \textfraction：页面中必须用来排放文本的最小比例。缺省值为 0.2，即要求每页的文字至少占据 20%。
% 而这通常不是我们想要的, 我们将这个要求降低到 5%。
% (2) \topfraction：页面顶部可以用来放置浮动对象的高度与整个页面高度的最大比例。缺省值为 0.7，即
% 放置在页顶部的浮动对象所占的高度不得超过整个页面高度 70%。
% (3) \bottomfraction: 页面底部可以用来放置浮动对象的高度与整个页面高度的最大比例。缺省值为 0.3。
% 有时如果多个浮动环境连续放在一起, latex也会将它们分在几个不同页，即使它们可在同一页放得下。
% 我们可以通过修改 \topfraction 和 \bottomfraction 分别设置顶端和底端的浮动环境的最大比例。
% (4) \floatpagefraction: 浮动页中必须由浮动对象占用的最小比例。因此在一浮动页中空白所占的比例
% 不会超过 1 - \floatpagefraction。缺省值为 0.5。
% 有时 LaTeX 会把一个浮动环境单独放在一页，我们通过设置要求这个环境至少要占据 85% 才能单独放在一页。
 
\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}
 
%------------------------浮动环境设置----------------------------------------------------------- 
 
 
%------------------插图、表格以及列表环境设置--------------------------------------------------- 
 
% 关于图片宏包graphicx，如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
 
% 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
 
% 声明标题的字体、字号
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}  
 
% 如果文章中有section，那么插图标题标签将是1.1, 1.2, 2.1等。 
% 我们可以如下设置，该命令指定了一个将更改的标签（如： \thefigure ）以及希望显示的标签
% 类型(如：\arabic{figure} ), 也就是说要将插图的序列号显示为阿拉伯数字，如1, 2, 3等。
\renewcommand{\thefigure}{\thesection\arabic{figure}}
 
% 可以使用 \captionsetup 设置标题样式，这样后面所有的标题样式都是根据 \captionsetup 重新设置的，
% 即 \captionsetup[FLOAT_TYPE]{OPTIONS}
% 其中可选参数FLOAT_TYPE 可以是table、subtable、figure、subfigure等。
\captionsetup[figure]{ 
	format=hang,                     % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad,                   % 分隔符是一个空格，指标题名称和序号直接的空隙
	font={song,minusfour,bf},        % 将fugure环境中的字体设置为： 宋体小四
	position=bottom                  % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置
}
 
 
% 表格环境设置
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 表的字体, 宋体小四
	position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
 
 
% 列表环境设置
% 列表就是将所要表达的内容分为若干个条目并按一定的顺序排列，达到简明、直观的效果。在论文的写作中会经常使用到列表。
% LaTeX 中常见的列表环境有 enumerate、itemize 和 description。这三种列表环境的主要区别是列表项标签的不同。
% enumerate 是有序的列表； itemize 以圆点作为标签；description 是解说列表，可以指定标签。
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}
 
%------------------------插图、表格以及列表环境设置------------------------------------------ 

%----------------------------设置目录的超链接--------------------------------------------------------
% \AtBeginDocument{%
\hypersetup{%
	% % unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项.
	bookmarksnumbered=true,
	colorlinks=true,
	hyperfigures=true,
	bookmarksopen=true,
	bookmarksopenlevel=0,
	linkcolor=purple,
	linktocpage=true,
	breaklinks=true}%
% }
% \if@gmcm@bwprint
% \AtBeginDocument{\hypersetup{hidelinks}}
% \else\relax\fi
\def\UrlAlphabet{%
	\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
	\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
	\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
	\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
	\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
	\do\Y\do\Z}
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlAlphabet}
\g@addto@macro{\UrlBreaks}{\UrlDigits}
 
%----------------------------设置目录的超链接--------------------------------------------------------
 
 
%--------------------------------中文标题格式设置-----------------------------------------
 
% 通过 setcounter 命令来控制目录深度,如显示三级目录
\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\ \ }
 
% 更改节、子节等的标题前序号的格式
\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}}
 
% 节标题格式, 居中，字体采用 \normalfont，大小采用 \normalsize
\renewcommand\section{\@startsection{section}{1}{\z@}%
	{2.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\bfseries\centering\zihao{4}\heiti}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{1.25ex\@plus -1ex \@minus -.2ex}%
	{1.25ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{1.25ex\@plus -1ex \@minus -.2ex}%
	{1.2ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
 
 
 
%-------------------------------中文标题格式设置--------------------------------------
 
 
 
%----------------------------以中文重命名数学定理相关的常量---------------------------
 
% 数学环境, 定理等设置
\newtheorem{definition}{\gmcm@cap@definition}
\newtheorem{theorem}{\gmcm@cap@theorem}
\newtheorem{lemma}{\gmcm@cap@lemma}
\newtheorem{property}{\gmcm@cap@property}
\newtheorem{corollary}{\gmcm@cap@corollary}
\newtheorem{assumption}{\gmcm@cap@assumption}
\newtheorem{problem}{\gmcm@cap@problem}
\newtheorem{example}{\gmcm@cap@example}
 
%数学定理相关的常量
\newcommand*{\gmcm@cap@definition}{\color{f8766d}\makebox[-3pt][r]{$\clubsuit$}定义}
\newcommand*{\gmcm@cap@theorem}{\color{2a7ae2}\makebox[-3pt][r]{$\heartsuit$}定理}
\newcommand*{\gmcm@cap@lemma}{\color{1a9850}$ \Square  $引理}
\newcommand*{\gmcm@cap@property}{\color{ffa725}$ \bigstar  $性质}
\newcommand*{\gmcm@cap@corollary}{\color{1a9850}$ \Square  $推论}
\newcommand*{\gmcm@cap@assumption}{\color{6a3d9a}$ \Square  $猜想}
\newcommand*{\gmcm@cap@problem}{\color{53a9ab}\makebox[-3pt][r]{\PencilRightDown\quad}题}
\newcommand*{\gmcm@cap@example}{\color{53a9ab}$ \Square  $例}

\newenvironment{solution}{{\noindent\kaishu 解：}}{\hspace*{\fill} \par}
\newenvironment{proof}{{\noindent\kaishu 证明：}}{\hspace*{\fill} $\square$\par\hspace*{\fill}}
%----------------------------以中文重命名数学定理相关的常量-----------------------------------
 
 
 
 
%----------------------------设置目录格式-----------------------------------------------
 
% 节的目录格式
\titlecontents{section}[0pt]{\vspace{2mm}\bfseries\heiti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% 小节的目录格式
\titlecontents{subsection}[30pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
 
\titlecontents{subsubsection}[55pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
 
 
% itletoc 宏包用于自定义目录样式，其中最常用的是下面这条目录样式命令。
% \titlecontents 命令来设置不同级别目录项的格式：
% \titlecontents{章节名称}[左端距离]{标题字体、与上文间距等}{标题序号}{空}{引导符和页码}[与下文间距]
% (1) 其中0pt（[左端距离]）是目录项到版芯左边界的距离；\vspace{2mm}表示与上文留出一定的垂直距离，该距离为2mm；
% \bfseries\heiti 把整条目录项的字体设为黑体。
% (2) 后面一项是设置目录项的头部，并在其后留出一个汉字宽度的距离。紧跟的是设置目录项主体的格式，
% 这里因为跟目录项头部相同而空置。
% (3) 再后面是设置填充命令和页码。这里用\titlerule*命令画出填充点，
% 这里是把垂直居中的实心圆点作为填充符号(习惯上中文不采用居下的填充点), 
% 并以10pt为包含一个填充符号的水平盒子的宽度，即这个宽度越小，填充点越紧密; 填充点后加上页码 \contentspage。
 
% 注意：用 titlesec 宏包可以在标题中加一些填充物，比如：一条水平线、一排连续或不连续的点等等。用以下三个命令来实现：
% (1) \titleline[<align>]{<horizontalmaterial>}
% 其中中 <align> 表示对齐方式，有三个参数 l、c、r，分别代表左对齐、居中对齐、右对齐；
% <horizontal material> 是要填充的材料，可以是文字、符号等等。
% (2) \titlerule [<height>]：表示在标题中添加一条水平线，<height> 是线的宽度。
% (3) \titlerule ∗[<width >]{<text>}：用于在标题中添加一条填充物，<width> 为填充物的宽度，<text> 为填充的文字或符号。
 
%----------------------------设置目录格式----------------------------------------------- 
%一些奇幻的东西
\pagestyle{plain}
\everymath{\displaystyle} % 美化行内公式的frac与int的排版
\newcommand{\md}[1]{{\color{purple}#1}}%
\RequirePackage{mathpazo} % 数学字体，注释掉就是默认的 mtpro2

%----------------------设置文章字体------------------------------
% 设置中文字体
\setCJKmainfont[BoldFont={NotoSansCJKsc-Medium.otf}]{NotoSerifCJKsc-Regular.otf}

% 设置英文字体
\setmainfont{HGB5X_CNKI}    %衬线字体  
\setmonofont{Fira Code}     %等宽字体，一般是打印机字体(中文都是等宽的) 
%----------------------设置文章字体------------------------------
\endinput