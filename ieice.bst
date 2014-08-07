%%% ieice.bst  jBibTeX Style File 電子情報通信学会論文誌用 v1.0 02/10/03 
% by nao <nao@s164.xrea.com> 
% $Id: ieice.bst,v 1.2 2005/09/13 03:18:05 nao Exp $
%    modified from the .bst file created by swk & loba
%    referred to style file by Ryutaroh Matsumoto
% This is an UNOFFICIAL style file.
%
% JBibTeX `jplain' family
	% version 0.30 for JBibTeX versions 0.30 or later, LaTeX version 2.09.
	% Copyright (C) 1990, all rights reserved.
	%
	% This file is derived from btxbst.doc of BibTeX 0.99c
	%
	% Copying of this file is authorized only if either
	% (1) you make absolutely no changes to your copy, including name, or
	% (2) if you do make changes, you name it something other than
	% jbtxbst.doc, jplain.bst, junsrt.bst, jalpha.bst, jabbrv.bst,
	% tipsj.bst, jipsj.bst, tieice.bst, jname.bst, jorsj.bst
	%
	% This restriction helps ensure that all standard styles are identical.
	% The file jbtxbst.doc has the documentation for this style.
	%
	% Please notify Shouichi MATSUI(matsui@denken.or.jp) of any bugs in
	% these standard styles or in this documentation file.
	% 松井 正一  (財) 電力中央研究所　情報システム部
%
% このファイル jbtxbst.doc は参考文献スタイルの理解を助けるため，cpp などを
% 使って，違うスタイルを作成する場合の雛型として使うための物である．
% Oren Patashnik 氏による，btxbst.doc を翻訳するとともに，日本語用に修正，追加
% を加えたものである．
%
% 標準スタイルは以下のようにして生成した後，
%	cpp -P -DJPLAIN jbtxbst.doc jplain.txt
%	cpp -P -DJUNSRT jbtxbst.doc junsrt.txt
%	cpp -P -DJALPHA jbtxbst.doc jalpha.txt
%	cpp -P -DJABBRV jbtxbst.doc jabbrv.txt
%	cpp -P -DTIPSJ jbtxbst.doc tipsj.txt
%	cpp -P -DJIPSJ jbtxbst.doc jipsj.txt
%	cpp -P -DTIEICE jbtxbst.doc tieic.txt
%	cpp -P -DJORSJ jbtxbst.doc jorsj.txt
%	cpp -P -DJNAME jbtxbst.doc jname.txt
% 不要なコメント行，空行を削除した後，ファイル名を変更すれば生成できる．
% (実際には後述の cpp.awk を使って gawk で生成した）．
% 
% ASCII 版の versinn 0.98 に基づく Kanji BibTeX で使われている jplain, jalpha,
% junsrt, jabbrv に近い形の bst ファイルを作るには，
%
%	cpp -P -DJPLAIN -DASCII98 jbtxbst.doc jplain98.txt
%
% というように, -DASCII98 を追加する．完全に同じではないが，かなり近い形の
% 文献リストデータ(bbl)が得られるようなスタイルファイルを得ることができる．
%
% cpp を持っていないとか，(PC 用の)C コンパイラーの cpp によっては上記の様に
% 処理できない場合がある．Turbo C 2.0 の cpp は賢こ過ぎて，上記の目的
% には使えない．また行頭に # がなくてもそれを cpp への指令だとみなす処理系でも
% うまくいかない場合がある．
% cpp でうまく処理できない場合に使える gawk 用のスクリプトを bst/cpp.awk という
% 形で用意してある．使い方については bst/generate.[bat|sh] を見よ！
%
% UNIX の cpp では処理できることを期待する．少なくとも SUN の cpp では
% 処理できた．
%
% 不幸にして cpp が使えないとか， gawk もないとかの場合には，以下の説明を
% 参考にして人間 cpp になって，editor を使って編集して作り出せばいい．
% (こんな不幸なことはないでしょうね？）
%
% cpp の出力は特定の行が削除される（あるいは空白行が付加される）ことを除けば
% 入力と同じである．以下のシークエンスは，# 文字が第１カラムにあるとして，
%	#if VAR
%	    VAR が 0 でない時に含める行
%	#else
%	    VAR が 0 の時に含める行
%	#endif
%
% VAR の値に応じてどちらの行群が使われるか，含まれるようになるかを示す．
% #else 部分はなくてもよい．#else, #endif の後にはコメントを書く事ができる．
% 変数は
%	#define VAR value
% で値を設定でき， #ifdef VAR で VAR が値を持っているか（定義されているか），
% #ifndef VAR で VAR が値を持っていないか（未定義か）を調べることができる．
% このファイル中で使っているもう１つの形式は #if !VAR であり，これは VAR の
% 値が 0 の時に後続の行群を含めるようにするものである．
%
% 規約: プリプロセッサのための変数としては，すべて大文字を使うことにすれば，
% 　　　どこにあるか見つけるのが簡単になる．
%
% 言い訳: cpp の機能をフルに使うように書けば，このファイルはもっと小さくできる．
%         しかし，作業した環境ではちゃんと使える cpp がなかったので，
%         オリジナルで使っていなかった機能は使っていない．
%
% cpp への(gawk への)コマンド行では，JPLAIN, JUNSRT, JALPHA, JABBRV, JIPSJ,
% TIPSJ, TIEICE, JNAME, JORSJ のいずれかを指定しておくこと（どれでもないと，
% JPLAIN をディフォールトとして使うようになっている．従って新しいスタイルを
% 作り出す場合には，このディフォルトを設定している部分を書き換えること）．
%
% それぞれの論理変数は，それぞれのスタイルで，真(1)か偽(0)に設定しておくこと．
% 現在使っている変数とその意味は以下の通りである．
%
%	LAB_ALPH:	文字列ラベルを生成(これが偽なら数字ラベルになる)
%	SORTED:		(数字ラベルでないなら）ラベル，著者などの情報を
%			使ってにソートする(偽ならソートされずに，出現順に並ぶ)
%	NAME_FULL:	著者，編者の名前として bibliography file 中に書かれた
%			物をそのまま使う(偽なら姓以外はイニシャルだけになる．
%			漢字表記された著者の場合には，姓と名の間にスペースが
%			あれば，姓だけになる)
%	ATIT_LOWER:	本以外（論文など）のタイトルは先頭の文字，コロンの後の
%			最初の文字以外は小文字にする(偽なら database 中のまま)
%	MONTH_FULL:	月の名前を省略形としない(偽なら省略形)
%	JOUR_FULL:	論文誌，雑誌などを省略形としない(偽なら省略形，現在は
%			その形式は ACM の出版物にある形式である)
%----------------------------------------------------------------------
% 松井による追加分
%	 IN_LOWER:		In でなく in　を使う．
%	 ONE_SENTENCE:  	1文の形にする．
%	 ED_SHORT:		Editor でなく Ed.
%	 FAMILY_FIRST:		英語表記著者の姓を先に，名を後にする．
%        FIRST_FAMILY_FIRST:    英語表記著者の第一著者だけ姓を先にする．
%	 NO_COM_AND:		3名以上の著者の時 and の前に , を入れない．
%	 SMALL_CAP:		表題は small cap フォント．
%	 KANJI_FULL_NAME:	漢字著者名は名まで出す．
%	 ED_IN_PAR :		編集者名を括弧に入れる．
%	 NO_EM:			本，雑誌名とかに強調指定(イタリック)は使わない．
%	 YEAR_IN_PAR:		年を括弧で囲む．
%	 ZENKAKU_PUN:		日本語文献に対しては全角の"，","．","："を使う．
%	 ZENKAKU_COLON:		１文形式の時，日本語著者の後には全角のコロンを
%				付ける．
%	 JIPSJ_LIKE:    	JIPSJ のような短い Vol., pp. 参照形式
%				Vol.=V, No.=N, pp. C--D, year=Y, month=M を
%				V, N(M Y), C--D のような順番で並べる．
%	 USE_FIRST_ONLY:	文字列ラベルには第１著者しか使わない．
%	 USE_KANJI_HOKA:	``ほか''でなく``他''を使う
%	 SHOW_BOOK_PAGES:	BOOK のページ数も出力する．
%----------------------------------------------------------------------
% ロバによる追加分
%	 TITLE_QUOTE:		タイトルを ``...'' にする。
% 
% swk
%        AFTER_AUTHOR_COMMA:	著者のあとは , で区切る
%
% ディフォールトのスタイルの指定（新しいスタイルを加える場合にはここを
% 変更する必要がある．変更しておかないと jplain になってしまう！）
%


%
% ASSCII98 が定義されていれば，ASCII 版の 0.98 に基づく Kanji BibTeX の
% スタイルファイルを使って得られる結果に近いものが得られるようにする．
% まったく同じになると期待してはいけない！！！
%


%

%

%

%

%

%

%

%
%

% tieic スタイル (ソートされない数値ラベルで，省略形を使う，１文形式)
% 電子情報通信学会論文誌

%--------------------------------------






%--------------------------------------

















%--------------------------------------

%

%

%





%
% by swk

%
%
%   エントリのフォーマット形式： Mary-Claire van Leunen が
%	"A Handbook for Scholars" で推奨している形式に近い．本の仲間の表題は
%	イタリック体で(強調されて)，それ以外の表題は(電子情報通信学会論文誌を
%	除いて，引用符なしで）文の形式で大文字，小文字が使われる．
%	このファイルでは，１文の形式でフォーマットするスタイル以外では，
%	主たるブロックの間に \newblock(\newline や \newpage に似た名前)を
%	出力するので，\ducumentstyle の引数として `openbib' オプションを指定
%	することで，open 形式のリスト，すなわちブロック間で改行され，ブロック
%	内ではインデントされた形式のリストを得る事ができる．
%	ディフォールトは closed 形式であり，ブロック毎に改行されたりしない．
%
%   文献リストの文字列ラベルの形式は以下の通り．
%		[Knu73] 著者（編者，キー）が１人の時
%		[AHU83] 複数著者の時は姓の頭文字を並べたもの
%			(Aho, Hopcroft, Ulman の場合には AHU となる)
%
%   文献リストの数値ラベルの形式は以下の通り．
%		[number]
%
%   文字列ラベルの形式のソートは以下の通り（次の順で文献が並ぶ）．
%		主キーがラベル，次が著者（編者などの場合もある），
%		その次が年，最後が表題のアルファベット順で並べられる．
%
%		漢字著者名の場合には yomi フィールドにローマ字表記を入れて
%		置く事で，文字列ラベルのラベルになる．書き方を工夫すれば，
%		日本語のラベルとすることもでき，さらに５０音順に並べることも
%		できる．詳しくは jbtxdoc.tex を見よ．
%
%   数値ラベルの形式のソートは以下の通り（次の順で文献が並ぶ）．
%		主キーが著者（編者などの場合もある），次が年，最後が表題の
%		アルファベット順で並べられる．
%
%		漢字著者名の場合には yomi フィールドにローマ字表記を入れて
%		置く事で，アルファベット順になる．書き方を工夫すれば，５０音
%		順に並べることもできる．詳しくは jbtxdoc.tex を見よ．
%
%   ソートされない場合の文献の順番：
%		本文中の引用順．
%
%   History
%   12/16/84	(HWT)	Original `plain' version, by Howard Trickey.
%   12/23/84	(LL)	Some comments made by Leslie Lamport.
%    2/16/85	(OP)	Changes based on LL's comments, Oren Patashnik.
%    2/17/85	(HWT)	Template file and other standard styles made.
%    3/28/85	(OP)	First release, version 0.98b for BibTeX 0.98f.
%    5/ 9/85	(OP)	Version 0.98c for BibTeX 0.98i:
%			fixed Theoretical Computer Science macro name;
%			fixed the format.vol.num.pages function.
%    1/24/88	(OP)	Version 0.99a for BibTeX 0.99a, main changes:
%			assignment operator (:=) arguments reversed;
%			the preamble$ function outputs the database PREAMBLE;
%			entry.max$ and global.max$ (built-in) variables replace
%			entry.string.max and global.string.max functions;
%			alphabetizing by year then title, not just title;
%			many unnecessary ties removed; \it ==> \em;
%			the `alpha' style uses a superscripted `+' instead of a
%			`*' for unnamed names in constructing the label;
%			the `abbrv' style now uses "Mar." and "Sept.";
%			the functions calc.label and presort now look at just
%			the fields they're supposed to;
%			BOOKLET, MASTERSTHESIS, TECHREPORT use nonbook titles;
%			INBOOK and INCOLLECTION take an optional type (e.g.
%			type = "Section"), overriding the default "chapter";
%			BOOK, INBOOK, INCOLLECTION, and PROCEEDINGS now allow
%			either volume or number, not just volume;
%			INCOLLECTION now allows an edition and series field;
%			PROCEEDINGS and INPROCEEDINGS now use the address field
%			to tell where a conference was held;
%			INPROCEEDINGS and PROCEEDINGS now allow either volume
%			or number, and also a series field;
%			MASTERSTHESIS and PHDTHESIS accept types other than
%			"Master's thesis" and "PhD thesis";
%			UNPUBLISHED now outputs, in one block, note then date;
%			MANUAL now prints out the organization in
%			the first block if the author field is empty;
%			MISC can't be empty---it requires some optional field.
%
%  以上は英語版の btxbst.doc の変更履歴である．
%
%	1989-06-02 松井正一(Shouichi Matsui)
%			C version 0.20 用に変更，３つのスタイルを追加	
%	1991-01-01 松井正一(Shouichi Matsui) 
%			C version 0.30 用に変更と微調整多数！新たなスタイルも
%			追加！
%
% エントリのフィールドの宣言
%
%   (April '84 edition の 231-232 ページに述べられている) Scribe と
%   同じようなものであるが，(J)BibTeX は名前の処理機能を持っているので，
%   fullauthor あるいは editors フィールドはない．
%   annote フィールドは注釈付きの文献リストスタイルを作る場合には使われるが，
%   このファイルで定義しているスタイルでは使っていないので，コメントアウト
%   されている．ここに示したフィールドの他に，組み込みの文献リスト内参照
%   (CROSSREF)フィールドもあるが，これについては後で説明する．

ENTRY
% フィールド群:
% 　　以下の説明で”新たな文を開始する”のは１文形式でフォーマットしない，
% 　　スタイルの場合にのみあてはまる．
  { address
%	通常は出版社，機関の住所を入れる．読者の為になる場合にのみ入れること．
%	例えば，大きな出版社の場合には省略すべきである．しかし，PROCEEDINGS
%	または INPROCEEDINGS の場合にはここには会議の開催地を書く．この２つの
%	エントリの型では，出版者，機関の住所が必要なら，publisher か
%	organization フィールドに含めること．
%    annote
%	長い注釈(注釈付き文献リスト用，新たな文を開始する)．
    author
%	(J)BibTeX 形式で書いた，著者の名前
    booktitle
%	参照されているのが本全体でない場合に，本の表題を入れる．本全部を
%	参照している場合には，これでなく title フィールドを使うこと．
    chapter
%	章(あるいは節など)の番号．
    edition
%	本の版，("Second" などの) 順序数でないといけない．
    editor
%	(J)BibTeX 形式で書いた，編者の名前．author フィールドもある場合には
%	著作が発表された本などの編者の名前を書く．
    howpublished
%	この奇妙な物がどうして出版されたか（新たな文を開始する）．
    institution
%	テクニカルレポートのサポート機関名
    journal
%	論文誌，雑誌の名前(いくつかマクロが用意されている)．
    key
%	アルファベット順に並べる時，ラベルを作る時，文献リスト内参照のキーとして
%	使われる（著者，編者がないときに必要である）．
    month
%	月(マクロが用意されている)．
    note
%	読者が参照文献を見つけるのに役立つ情報（新たな文を開始する）．
    number
%	論文誌，雑誌，テクニカルレポートの番号，あるいはシリーズ中の番号．
    organization
%	会議のスポンサー（あるいはマニュアルの出版社）の機関名で，著者（編者）が
%	ない場合で，この情報からではラベルが奇妙になる場合，あるいは文献リスト内%	参照する場合には，適当な簡潔な機関名を key フィールドに入れること．
    pages
%	ページ番号，ページ数，あるいはページ範囲（範囲は `--'  を使って，
%	単純な範囲ではない場合には後ろに `+' を付けて示すこと）．
    publisher
%	出版社(主体)の名前．
    school
%	学校(大学)の名前（学位論文用）．
    series
%	複数巻からなる本のシリーズ名，各々の本は各々の表題を持っているはず．
    title
%	参照しているものの表題．
    type
%	テクニカルレポートの場合にディフォルトで使われる "Technical Report"
%	の代わりの名称（例えば "Research Note"），あるいは学位論文の種類，
%	あるいは本のパートの名前．
    volume
%	論文誌などの巻数，あるいは複数巻の書物の巻数．
    year
%	年は数字だけでないといけない（正規化した後では，４つの数字で終わらない
%	といけない．新たな文を開始しない）．
%	昭和53とかを使ってもかまわないが，jalpha などで生成されるラベルが変な
%	ものになることがあるので注意すること．
    yomi
%	著者，編集者名の「読み」をauthor, editorなどの書式で
%	英語風に書く．ひらがなで書けば以外では五十音順の
%	ソートもできる．詳しくは jbtxdoc.tex を見よ．

  }

% 日本語の文献かどうかのフラグ
  {is.kanji.entry}

% 以下の文字型変数は引用ラベルを作成するために使われる．メモリが足りない
% 場合には，sort.label は on the fly に簡単に作成できる．


  { label }


% それぞれのエントリの型に対応した関数は，先ず output.bibitem を呼んで
% \bibitem とその引数を .BBL ファイルに書き出す．次に様々なフィールドが
% フォーマットされ output か output.check によって書き出される．これらの
% 出力関数は空文字列が渡されていないことを確認しながら，区切り記号（カンマ，
% ピリオド，コロン，\newblock）を書き出す処理を行う．最後に fin.entry が
% 呼ばれ，文の終わりのピリオドを書きだして，処理が終了する．
%
% 参考文献はいくつかのブロックとしてフォーマットされる：
% open 形式では，ブロックは新しい行を開始し，ブロック中ではインデントされる．
% ブロック中には複数の文があってよい（とはいっても文法的にいう文ではなく，
% ピリオドで終わる単語列ではあるが）．エントリ関数は最初のブロック以外の
% ブロックを出力する前には new.block を呼ばねばならない．
% また新しい文を開始する場合には new.sentence を呼ばねばならない．
% 出力ルーチンは，ピリオドが２つ続いたりしないように，２つの new.sentence
% の間には，空文字列でないものがあることを確認する必要がある．
% new.block についても同じである．
%
% 出力ルーチンはその引数を直ちに出力しない．そのかわりに通常は
% スタックに置き，(区切り記号として何が必要か分かった時点で)次の
% 出力ルーチンが出力する．従って出力ルーチンはスタック上のデータに
% 必要な区切り記号を付加して書き出す必要がある．
%
% どの区切り記号が必要かを判定するために，output.state を使う．
% その値は以下のいずれか．
%	before.all		\bibitem の直後
%	mid.sentence		文の途中，後続がある場合にはカンマが必要
%	after.sentence		文の直後．ピリオドが必要
%	after.block		ブロック(文)の直後．ピリオドと\newblock が必要
%------------------------------------------------------------------------
%	after.author		著者名の後(: を付けるのに使う)
%------------------------------------------------------------------------
%
%*****************************************************************************
%注意：
%
%  以下のコメント中で述べられているアルゴリズムは，日本語用のスタイルファイル
%  の作成のために，コードのみ変更した部分があるので，実際のコードと必ずしも
%  同じものではない．
%
%*****************************************************************************
%
% VAR: output.state : INTEGER		-- 出力の状態変数
%
% output.nonnull 関数は（渡された物が空文字列でないとして），引数をスタック
% に保存し，保存しておいた文字列に必要とされる適当な区切り記号を後ろに
% 付加して書き出す．テストの順番は頻度順になっている．
%
% １文の形にする場合(1が真の場合)には，以下と異なるアルゴリズムで
% ある．実際のコードを参照のこと！
%
% output.nonnull(s) ==
%  BEGIN
%	s := argument on stack
%	if output.state = mid.sentence then
%	    write$(pop() * ", ")
%		  -- "pop" は関数ではない．スタックトップのデータを使う．
%	else
%	    if output.state = after.block then
%		write$(add.period$(pop()))
%		newline$
%		write$("\newblock ")
%	    else
%		if output.state = before.all then
%		    write$(pop())
%		else	    -- output.state は after.sentence のはず
%		    write$(add.period$(pop()) * " ")
%		fi
%	    fi
%	    output.state := mid.sentence
%	fi
%	push s on stack
%  END
%
% output は 引数が空でないなら（引数は未定義フィールドかもしれないので，
% 必ずしも文字列ではない）， output.nonnull を呼び出す．
%
% output(s) ==
%  BEGIN
%	if not empty$(s) then output.nonnull(s)
%	fi
%  END
%
% output.check はほとんど output 関数と同じであるが，必要なフィールドが
% ないことをユーザーに警告する．（これはそのフィールドのない文献情報は
% 良いものではないことを知らせるため，またそのフィールドがなくても，出力される
% フォーマット形式がまあまあの物になるようにするためである）．
%
% output.check(s,t) ==
%  BEGIN
%	if empty$(s) then
%	    warning$("empty " * t * " in " * cite$)
%	else output.nonnull(s)
%	fi
%  END
%
% output.bibitem 関数は現在のエントリに対する \bibitem を書き出し
%  (ラベルは既にできていると仮定する)，状態に応じた区切り記号を設定する．
% 出力の規約に従った文字列をスタックに残す．
%
% output.bibitem ==
%  BEGIN
%	newline$
%	write$("\bibitem[")	% 以下３行は文字列ラベル用
%	write$(label)		%
%	write$("]{")		%
%	write$("\bibitem{")	% この行は数値ラベルの時
%	write$(cite$)
%	write$("}")
%	push "" on stack
%	output.state := before.all
%  END
%
% fin.entry 関数はスタックに残っている文字列にピリオドを付加し，エントリの
% 処理を終える．もし状態がまだ before.all であればこのエントリに対しては何も
% 出力されていないので，結果は変なものになるが，利用者はそれに気づく．
% 文献は引用されているのであるから，引用ラベルを作るために bibitem は
% 必要であるから，エントリを省略したりしない．
%
% fin.entry ==
%  BEGIN
%	write$(add.period$(pop()))
%	newline$
%  END
%
% new.block 関数は出力する新たなブロックの準備を行い，
% new.sentence は新たなセンテンスの準備を行う．
%
% new.block ==
%  BEGIN
%	if output.state <> before.all then
%	    output.state := after.block
%	fi
%  END
%
% new.sentence ==
%  BEGIN
%	if output.state <> after.block then
%	    if output.state <> before.all then
%		output.state :=  after.sentence
%	    fi
%	fi
%  END
%

INTEGERS { output.state before.all mid.sentence after.quote after.sentence after.block
           after.author }


% 以下の３つの関数は AND, OR, NOT のためのものである．

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=

  #4 'after.author :=

  #5 'after.quote :=

}

% s, t  は作業用の文字列変数
STRINGS { s t }

% 全角の"，","．”を使う時のための関数
% 参考文献はコンパクトに組みたいので，私はこれは好きではないが，
% ASCII 版の 0.98 ではこの機能があったので．



% 全角のコロンを使う場合にはこの定義はここにないといけない．

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}


FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
  { is.kanji.entry
      { "，" * write$ }
      { ", " * write$ }
  if$ }
    { output.state after.block =
	{ 

          add.period$ write$

	  newline$
	  "\newblock " write$
	}

	{ output.state after.author =

	    { author empty$ editor empty$ and organization empty$ and
		{write$}

            { is.kanji.entry
                 { "，" * write$ }
                 { ", " * write$ }
              if$ }

	      if$

	      mid.sentence 'output.state :=
	    }
	    'write$
	  if$
	}

      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$


  "\bibitem{" write$


  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

% この関数はエントリの出力を終りにする

FUNCTION {fin.entry}
{ 
       add.period$
       write$
       newline$
}

FUNCTION {blank.sep}
{ after.quote 'output.state :=
}


FUNCTION {new.block}
{ output.state before.all =

    { after.author 'output.state := }
    'skip$

  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

% 時として，ブロックが十分に長い場合にのみ新たなブロックを開始しないといけない．
% new.block.checka 関数はその引数が空でない場合に new.block を実行する．
% new.block.checkb 関数はその２つの引数がどちらも空にない場合に new.block を
%		   実行する．

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

% new.sentence.check 関数群も同じようなもの

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

% エントリのデータ群をフォーマットするための関数群
% これらの関数群では，カンマあるいはピリオド（ピリオドの後にピリオドが続いたり
% しないように add.period$ を使って）を付けられるように，文字列か空文字列
% を出力することを規約とする．
%
% 役にたつ補助関数 field.or.null は引数が未定義フィールド（データベースから
% データを読んだ時に値の設定されていないフィールド）かどうか，あるいは
% 空白以外の文字を含まない文字列かどうかをチェックし，そうであれば空文字列
% を値として返す．
% この関数の主たる目的は（それだけではないが）スタックトップに残っている
% 値が未定義フィールドでなく，文字列であることを保証するためことである．
%
% field.or.null(s) ==
%  BEGIN
%	if empty$(s) then return ""
%	else return s
%  END
%
% もう１つの補助関数 emphasize は引数が空文字列でなければそれに強調指定を
% 付加した値を返す．空文字列なら空文字列を返す．イタリック補正は付加しない
% ので，区切り記号が続く場合にのみ使うこと．
%
% 漢字を含む文字列の時には強調指定を付加しない．また 1 が定義されていれば
% 強調指定を付加しない．
%
% emphasize(s) ==
%  BEGIN
%	if empty$(s) then return ""
%	else
%          if is.kanji.str$(s) then return s
% #if    1
%          return s
% #else !1
%          else return "{\em " * s * "}"
% #endif 1
%
% format.names 関数は，基本的には((J)BibTeX の名前形式で書かれた）引数を，カンマ
% で区切りながら，また最後の名前の前には and を前に付けて（最後が others で
% あれば et~al. として and を付けずに；漢字著者名の場合には et~al. ではなくて，
%  "ほか"あるいは"他" を使い，カンマで区切るだけで and は付けずに），
% "First Von Last, Junior" の形にフォーマットする．（名前のフォーマット形式
% の指定によっては First は省略形とされることもある）．
% 引数には最低１つの名前がなければならない．
%
% 以下のアルゴリズムは日本語に対応する，新しく導入したスイッチ（変数）に対応
% する，ためにコード部分が大幅に書き換えられているので，コードとは必ずしも
% 一致していない．しかし基本的な処理の流れは変わっていない．
%
% VAR: nameptr, namesleft, numnames: INTEGER
% pseudoVAR: nameresult: STRING		(it's what's accumulated on the stack)
%
% format.names(s) ==
%  BEGIN
%	nameptr := 1
%	numnames := num.names$(s)
%	namesleft := numnames
%	while namesleft > 0
%	  do
% 名前をフォーマットする形式が大きく変更されている
%				% for full names:
%	    t := format.name$(s, nameptr, "{ff~}{vv~}{ll}{, jj}")
%				% for abbreviated first names:
%	    t := format.name$(s, nameptr, "{f.~}{vv~}{ll}{, jj}")
%
%	    if nameptr > 1 then
%		if namesleft > 1 then nameresult := nameresult * ", " * t
%		else if numnames > 2
%		       then nameresult := nameresult * ","
%		     fi
%            % この部分も大きく変更されている
%            % 漢字著者なら and を付けない， et~al. でなく"ほか/他"とする．
%		     if t = "others"
%		       then nameresult := nameresult * " et~al."
%		       else nameresult := nameresult * " and " * t
%		     fi
%		fi
%	    else nameresult := t
%	    fi
%	    nameptr := nameptr + 1
%	    namesleft := namesleft - 1
%	  od
%	return nameresult
%  END
%
% format.authors は author があれば format.names(author) の値を，なければ
% 空文字列を返す
%
% format.authors ==
%  BEGIN
%	if empty$(author) then return ""
%	else return format.names(author)
%	fi
%  END
%
% format.editors は format.authors と同じであるが， editor フィールドを
% 使い，また後ろに ed., eds. などを付ける．
%
% 編集者を括弧に入れるなどの処理が付加されている．またed., eds. などの
% 省略形を使うとか，漢字著者の場合には（編）にするとかの変更もなされている．
%
% format.editors ==
%  BEGIN
%	if empty$(editor) then return ""
%	else
%	    if num.names$(editor) > 1 then
%		return format.names(editor) * ", editors"
%	    else
%		return format.names(editor) * ", editor"
%	    fi
%	fi
%  END
%
% 他のフォーマット関数も同じようなものなので，コメントバージョンは示さない．
%
% この関数の中の `pop$' 未定義値を取り去り空文字列を返すために，
% `skip$' はコピーした(duplicate$した)値そのものを返すために使われている．

% 全角のコロンを使わなければ，この定義はここにあればよい．



FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}


INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
% まだ名前が残っていれば
    { namesleft #0 > }
% 先ず現在注目している順番の名前をフォーマットする．

    { s nameptr "{ff}{ll}" format.name$ is.kanji.str$

	{s nameptr "{ff}{ll}" format.name$ 't :=}



 	{s nameptr "{f{.}.~}{vv~}{ll}{, jj}" format.name$ 't :=}


      if$

% 第２番目以降？
      nameptr #1 >
% 第２番目以降
% まだ２人以上残っている？
	{ namesleft #1 >
%   まだ２人以上残っている

        { is.kanji.entry
            { "，" * t * }
            { ", " * t * }
        if$ }
%	    {", " * t * }

%   もう最後の１人だ！
%     最後の名前が others かな？

	    { t "others" =

%       そうだ！
 		{ s is.kanji.str$

 			{"他" * }


 			{", et~al." * }

 		  if$
 		}
%        others でないぞ！
 		{ s is.kanji.str$

                    { is.kanji.entry
                         { "，" * t * }
                         { ", " * t * }
                     if$ }
% 		    {", " * t * }

% Small caps を使う場合でも and は roman でないといけない

%                   nameptr #1 > 
                    {", and " * t * }
% 		    {", and " * t * }
%                  


 		   if$
 		}
	      if$
	    }
	  if$
	}
% 最初の名前だ！
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
% Small caps の場合には {\sc, } で囲む

    { author format.names }

  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }

    { editor format.names

      editor num.names$ #1 >
 	{ editor is.kanji.str$

% 電子情報通信学会論文誌では editor, editors の形式が違う！

 		{"（編）" * } {", eds." * } if$


 	}
 	{ editor is.kanji.str$


 		{"（編）" * } {", ed." * } if$


 	}
      if$
    }
  if$
}

% 編集者を括弧でくくる場合

FUNCTION {format.in.ed.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ editor is.kanji.str$
% 電子情報通信学会論文誌では editor, editors の形式が違う！

		{"（編），" *} {", eds." * ", " * } if$

	}
	{ editor is.kanji.str$

		{"（編），" *} {", ed."  * ", " * } if$

	}
      if$
    }
  if$
}

FUNCTION {format.in.ed.editors.incoll}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ editor is.kanji.str$
% 電子情報通信学会論文誌では editor, editors の形式が違う！

		{"（編）" *} {"eds. " swap$ * } if$

	}
	{ editor is.kanji.str$

		{"（編）" *} {"ed. " swap$ *} if$

	}
      if$
    }
  if$
}



% format.title 関数は本の仲間でないものの表題をフォーマットするのに使われる．
% 殆どのスタイルでは（最初の文字とコロンの後（スペースが続いているかも
% しれない）の最初の文字を除いて），変換されて欲しくない大文字は中括弧
%  `{', `{' で囲まれていると期待して，タイトルの大文字を小文字に変換する．
% いくつかのスタイルではこの変換は行わずに，データベース中のままとする．
%
% 電子情報通信学会のスタイルではタイトルを``''で囲む．

FUNCTION {format.title}
% １文形式の場合にはタイトルの出力状態を after.author にしてから，処理開始


{ after.author 'output.state :=
  title empty$


    { "" }


%    { "``" title "t" change.case$ * ",'' " * }
    { is.kanji.entry
      { "``" title "t" change.case$ * "，\inhibitglue '' " * }
      { "``" title "t" change.case$ * ",'' " * }
    if$ }


  if$
}

% ディフォルトで (J)BibTeX は大域変数 global.max$ の値を (J)BibTeX の定数である
% glob_str_size に設定する．同様に entry.max$ の値をエントリの文字列の最大長で
% ある ent_str_size に設定する．
% そんなことはないとは思うが，これを変更してもよい．
%
% n.dashify 関数は文字列中の `-' を `--' に変換する．
%
% pseudoVAR: pageresult: STRING		(it's what's accumulated on the stack)
%
% n.dashify(s) ==
%  BEGIN
%	t := s
%	pageresult := ""
%	while (not empty$(t))
%	  do
%	    if (first character of t = "-")
%	      then
%		if (next character isn't)
%		  then
%		    pageresult := pageresult * "--"
%		    t := t with the "-" removed
%		  else
%		    while (first character of t = "-")
%		      do
%			pageresult := pageresult * "-"
%			t := t with the "-" removed
%		      od
%		fi
%	      else
%		pageresult := pageresult * the first character
%		t := t with the first character removed
%	    fi
%	  od
%	return pageresult
%  END

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

% format.data 関数は月と年をフォーマットするためのものであり，月だけあって，
% 年がない場合には警告メッセージを出し，どちらもなければ空文字列を返す．
%
% 文献を1文の形式とする場合には原則的には年月は括弧に入れる．
% また情報処理学会英文論文誌以外の1文形式では月は表示しない．

FUNCTION {format.date}

{ before.all 'output.state :=
  year empty$
     { "there's no year in " cite$ * warning$
       ""
     }
% 情報処理学会英文論文誌では括弧の中に month year を並べる


%   { pages empty$
%    { month empty$
%	'year
%	{ year }
%	{ month " " * year * }
%      if$
%    }
    { month empty$
%	'year

  { is.kanji.entry
      { "，" year * }
      { ", " year * }
  if$ }
%	{ ", " year * }

  { is.kanji.entry
      { "，" month * " " * year * }
      { ", " month * " " * year * }
  if$ }
%	{ ", " month * " " * year * }

      if$
%    }
%   if$
   }
%     { month * " " * year *  }



  if$
}


% format.btitle 関数は本の仲間のエントリの表題をフォーマットする．大文字
% 小文字はそのままにしておき，強調指定を付ける(1 が指定されていれば，
% \em は付加されないことになっている）．
%
% 電子情報通信学会論文誌ではタイトルは二重引用符で囲む

FUNCTION {format.btitle}

{after.author 'output.state :=

%title emphasize ", " *
  is.kanji.entry
    {title emphasize "，" *}
    {title emphasize ", " *}
  if$ 

}


% いくつかの関数では２つの文字列を連結する時に，後ろの文字列が長いもので
% ない（３文字未満）の時にタイ(~)を間に入れて，それより長ければ，空白を
% 間に入れて，連結する必要がある．連結結果はスタックに置く．
%
% \bibliography ではピリオド `.' の後に余分な空白はつけ加えられないので，
% \sfcode`\.=1000 が指定されているので，省略形の後でも単なる空白でよい．
%
% tie.or.space.connect(str1,str2) ==
%    BEGIN
%	if text.length$(str2) < 3
%	  then return the concatenation of str1, "~", and str2
%	  else return the concatenation of str1, " ", and str2
%    END

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

% either.or.check 関数はいずれか一方しか使えないフィールドが両方使われて
% いた場合に文句をいう．
%
% either.or.check(t,s) ==
%  BEGIN
%	if not empty$(s) then   --- オリジナルでは not が抜けていた（バグ）
%	    warning$(can't use both " * t * " fields in " * cite$)
%	fi
%  END

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

% format.bvolume 関数は volume, そしておそらくは複数巻からなるシリーズの
% シリーズ名をフォーマットするために使われる．volume と series のフィールドが
% 両方ある場合には，series はシリーズの表題である(参照している巻の表題は title
% に書かれている）と仮定し "of シリーズ表題" を付加する．この関数は文の途中で
% 呼ばれる．
%
% 日本語のスタイルでは，volume でなく， Vol. を使う．シリーズ名, Vol. の
% 形式とする．

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { volume is.kanji.str$
	{ volume }
	{ is.kanji.entry
	    {"第" volume * "巻" *}
	    {"vol." volume * }
	  if$
	}
      if$
      series empty$
	'skip$
	{ series is.kanji.str$
	    { volume empty$
		{series swap$ * }

%		{series ", " * swap$ * }
                { is.kanji.entry
                     {series "，" * swap$ * }
                     {series ", " * swap$ * }
                  if$ }

	      if$
	    }
	    { " of " * series emphasize * }
	  if$
	}
      if$
%      "volume and number" number either.or.check
    }
  if$
}

% format.number.series 関数はシリーズ名, そしておそらくはシリーズ中での番号を
% フォーマットするために使われる．これは format.bvolume に似ているが，
% この関数では series は存在し，volume はあってはならない(volume があれば
% 空文字列を返す)．number フィールドが空であれば，series をそのまま出力する
% (空かも知れない)．series にはシリーズの表題が入っている(title フィールドに
% 参照しているものの表題が入っている）と仮定して，"in <series>" の形で出力する．
% この関数は文の先頭で使われるので， Number の最初は大文字である．
%
% 日本語のシリーズ表題なら，<series>, <number> の形になる．
% 日本語のスタイルでは number, Number でなく， No. を使うように変更した．

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series empty$
	    { series field.or.null }	
%            { series field.or.null * ", " } 
             { is.kanji.entry
                 { series field.or.null * "，" } 
                 { series field.or.null * ", " } 
              if$ }
        if$
        }
	{ number is.kanji.str$ 
	    { number }
	    {"no." number * }
	  if$
	  series empty$
            {}
%	    { "there's a number but no series in " cite$ * warning$ }
	    { series is.kanji.str$

%	        { series ", " * swap$ * }
                { is.kanji.entry
                    { series "，" * swap$ * }
                    { series ", " * swap$ * }
                 if$ }

	        { "in " * series * }
	      if$
	    }
	  if$
	}
      if$
    }
    { "" }
  if$
}

% format.edition 関数は edition があれば " edition " 文字列を付加する．
% これは文の先頭で使われないので，edition は小文字に変換する．
% 日本語の edition に対しては " edition" は付加しない．

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition is.kanji.str$
	{ edition }
        { is.kanji.entry
	    {"第" edition * "版" *}
	    { output.state mid.sentence =
	      { edition "l" change.case$ " edition" * }
	      { edition "t" change.case$ " edition" * }
              if$
	    }
	  if$
        }
      if$
    }
  if$
}

% format.pages 関数は本のページ範囲をフォーマットする（希に論文/記事のページ
% 範囲のフォーマットにも使われる).
%
% multi.page.check 関数は "page/p." か "pages/pp. " のどちらを使うのが適切か
% 判断するために page フィールドに "-", ",", "+" の文字が含まれているかどうか
% 調べる．日本語用のスタイルでは page/pages の代わりに p./pp. を使っている．
%
% 注意：ここで使っている global.max$ は文字列の残り全部という意味で使っている．
%
% VAR: multiresult: INTEGER	(actually, a boolean)
%
% multi.page.check(s) ==
%  BEGIN
%	t := s
%	multiresult := false
%	while ((not multiresult) and (not empty$(t)))
%	  do
%	    if (first character of t = "-" or "," or "+")
%	      then multiresult := true
%	      else t := t with the first character removed
%	    fi
%	  od
%	return multiresult
%  END

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

% 日本語のスタイルでは原則として page/pages でなく p./pp. を使う．
% 情報処理学会英文論文誌では pp. は省略する．

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check

 	{ "pp." pages * }
	{ "p." pages *}

      if$
    }
  if$
}

% format.vol.num.pages 関数は論文誌，雑誌の論文，記事の volume, number,
% ページ範囲をフォーマットする．その形式はスタイルで異なるので，コードを
% 参照のこと．
%
% 　情報処理学会英文論文誌では volume, number (year), pages の形で並べる
% また volume は Vol.を付けずに bold でタイプセットする． No. も付けない．
% 　電子情報通信学会論文誌では volume は Vol.を付けずに bold でタイプセットし，
% No. も付けない．
% 　日本オペレーションズリサーチ学会論文誌では，情報処理学会英文論文誌と
% 同じような形であるが，volume を bold でタイプセットせずに， Vol. を使う．




%
FUNCTION {format.vol.num.pages}
{ volume empty$

 {""}

 {
 pages empty$

   {
   number empty$

     {"vol." volume * }

     { is.kanji.entry
        {"vol." volume * "，" * }
        {"vol." volume * ", " * }
       if$
     }
    if$

    }

    { is.kanji.entry
      {"vol." volume * "，" * }
      {"vol." volume * ", " * }
    if$
    }
   if$

  }
  if$

  number empty$
    'skip$

    { number is.kanji.str$
        { number *}
        {"no." * number *}
      if$

      volume empty$
        {}
%	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$

    }
  if$

  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ number empty$

 	    { format.pages * }
% 	    { ", " * format.pages * }
            { is.kanji.entry
               { "，" * format.pages * }
               { ", " * format.pages * }
             if$ }

	  if$
	}
      if$
    }
  if$
}




% format.chapter.pages 関数は chapter が空でなければ，その前に type フィールド
% の文字列（それが空なら "chapter"を)付加する．pages があればそれを後ろに
% 加える．新たな文を開始したりしない．
%
% chapter が日本語文字列の場合には "chapter" は付加しない．

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
	{ chapter is.kanji.str$
	    { "" }
	    { is.kanji.entry
		{"章"}
		{"chapter"}
	      if$
	    }
	  if$
	}
	{ type "l" change.case$ }
      if$
      chapter is.kanji.str$ not is.kanji.entry and
          {"第" chapter * swap$ *}
          { chapter is.kanji.str$
		{chapter *}
		{chapter tie.or.space.connect}
	    if$
	  }
      if$
      pages empty$
	'skip$

%	{ ", " * format.pages * }
        { is.kanji.entry
           { "，" * format.pages * }
           { ", " * format.pages * }
         if$ }

      if$
    }
  if$
}

% format.in.ed.booktitle 関数は，editor フィールドがあればそれを表題の前に
% 置いて，"In <booktitle>" の形で始まる文を開始するために使われる．
%
% 情報処理学会英文論文誌，電子情報通信学会論文誌などでは 1 を 1 に
% しておくことで，編集者名は括弧に入れる
% 本のタイトルが日本語なら In　は付けない。１文形式でフォーマットする場合などに
% In... でなく in ... の形式とするには，1 を 1 にしておく．


FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { booktitle }
%	{ booktitle ", " * format.in.ed.editors * }
        { is.kanji.entry
           { booktitle "，" * format.in.ed.editors * }
           { booktitle ", " * format.in.ed.editors * }
         if$ }
     if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle.incoll}
{ booktitle empty$
    { "" }
    { editor empty$
 	{ booktitle is.kanji.str$
            { booktitle }
            { "in " booktitle }
        if$
        }
 	{ booktitle is.kanji.str$
	    { booktitle "，" * format.in.ed.editors.incoll * }
 	    { "in " booktitle * ", " * format.in.ed.editors.incoll * }
        if$
        }
     if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle.inpro}
{ booktitle empty$
    { "" }
    { editor empty$
        { booktitle }
        { is.kanji.entry
           { booktitle "，" * format.in.ed.editors.incoll * }
           { booktitle ", " * format.in.ed.editors.incoll * }
         if$ }
     if$
    }
  if$
}


% empty.misc.check 関数はソートされる時，文字列ラベル使う時に key フィールドが
% 空でないのに，６つのフィールドが全部空なら文句をいう．ソートされない，
% 数値ラベルの時には６つのフィールドが全部空なら文句をいう．

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and



    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

% format.thesis.type 関数は type フィールドが空でなければ(大文字，小文字変換
% した) type フィールドの値を，そうでなければ既にスタックに積まれている
% ("Master's thesis" や "PhD thesis"などの)文字列を返す．

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

% format.tr.number 関数は type が空でなければその値で，空なら "Technical Report"
% で始まり，number があればそれが後に続く文字列を返す． number がなければ
% 先頭を大文字にした前述の文字列を返す．文の先頭で使われる．

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

% さて文献リスト内参照用の関数の説明である．これらの関数は文献データベース
% 中のエントリで，他のエントリのデータベースキーが crossref フィールドに
% 書かれている時に，起動される．この機能によって論文集などの中の論文から
% 論文集などを参照することができる．このファイル中のスタイルでは以下の
% ５つのケースが想定されている．
% (1) ARTICLE が他の ARTICLE を参照している;(2) BOOK, (3) INBOOK, あるいは
% (4) INCOLLECTION が他の BOOK を参照している;(5) INPROCEEDINGS が PROCEEDINGS
% を参照している．それぞれについて後で詳しく説明する．
%
% ARTICLE エントリタイプは他の ARTICLE エントリを文献リスト内参照してもよい．
% これは論文誌/雑誌がある１つの話題の特集になっている時に，JOURNAL タイプなど
% というものはないから，これを著者，表題のない ARTICLE として扱わなければなら
% ないからである．この時にはその journal が参照文献リストに含まれている場合に，
% 警告メッセージが2つ出される．でも世の中なんてしょせんこんなものさ．
%
% "In" でなく "in にするとか，\em を付けないようにするとかできるように
% コードは変更されており，必ずしも以下のアルゴリズムと一致しない．
%
% format.article.crossref ==
%  BEGIN
%	if empty$(key) then
%	    if empty$(journal) then
%		warning$("need key or journal for " * cite$ *
%						" to crossref " * crossref)
%		return(" \cite{" * crossref * "}")
%	    else
%		return("In " * emphazise.correct (journal) *
%						" \cite{" * crossref * "}")
%		fi
%	else
%	    return("In " * key * " \cite{" * crossref * "}")
%	fi
%  END
%
% 他の文献リスト内参照用の関数も同じようなものなので，コメントバージョンはない．

FUNCTION {format.addr.pub}
{ publisher empty$
    { "" }
    { address empty$
	{ publisher }
        { is.kanji.entry
            { publisher "，" * address * }
            { publisher ", " * address * }
        if$ }
%	{ publisher ", " * address * }
      if$
    }
  if$
}

FUNCTION {format.paddress}
{ address empty$
    { "" }
    { address }
  if$
}


FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
 	{ title is.kanji.str$
 	    { " " journal *  }


  	    { " " journal * }


          if$
	}
      if$
    }
    { title is.kanji.str$
 	{ " " key * }

  	{ "in " key * }

      if$
    }
  if$
  " \cite{" * crossref * "}" *
}

% 文献リスト内参照されているものの編者名としては姓のみを，編者の人数に
% 応じて，"editor", "editor1 and editor2", "editor1 et~al." の形式で表現する．
%
% 電子情報通信学会論文誌では参照先の著者名もフルネームで出力する．

FUNCTION {format.crossref.editor}
{ editor is.kanji.str$

     {editor #1 "{ff}" format.name$ duplicate$

      empty$
 	{pop$ editor #1 "{ll}" format.name$}
 	'skip$
      if$
      }

      {editor #1 "{vv~}{ll}" format.name$}

  if$
  editor num.names$ duplicate$
  #2 >
    { editor is.kanji.str$

	  {pop$ "他" *} {pop$ ", et~al." * } if$

    }
    { #2 <
	'skip$

	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =

 	    { editor is.kanji.str$

 		{"他" *} {", et~al." * } if$

 	    }
 	    { editor is.kanji.str$
 		{

%		  ", " *
                  is.kanji.entry
                      { "，" *  }
                      { ", " *  }
                   if$ 

 		   editor #2 "{ff}" format.name$ duplicate$
 		   empty$
 			{pop$ editor #2 "{ll}" format.name$}
 			'skip$
 		   if$
 		 *
 		}
 		{" and " * editor #2 "{vv~}{ll}" format.name$ * }
 	      if$
 	    }
	  if$
	}
      if$
    }
  if$
}

% BOOK (INBOOK) エントリ型では(複数巻からなるものの一部であるとして)他の
% BOOK(複数巻全部) を文献リスト内参照してもよい．
% 普通は editor があるから，その時は参照情報にそれを使う．なければ key
% フィールドが空でなければ key を，key が空なら(シリーズに複数巻の表題が入って
% いるはずだから) series フィールドを使う．

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
       title is.kanji.str$

 	{"  "} {"in "} if$

    }
    { volume is.kanji.str$
	{ volume }
	{ is.kanji.entry
	    {"第" volume * "巻" *}
	    {"vol." volume tie.or.space.connect " of " *  }
	  if$
	}
      if$
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }

	    { series is.kanji.str$

%		{ series ", " * swap$ * }
                { is.kanji.entry
                     { series "，" * swap$ * }
                     { series ", " * swap$ * }
                 if$ }

	        { series * }
	      if$
	    }

	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

% INCOLLECTION エントリ型では BOOK (論文集であるとして) を文献リスト内参照して
% もよい，あるいは INPROCEEDINGS は PROCEEDING を文献リスト内参照してもよい．
% editor が普通はあるから，それを参照情報として使う．key フィールドが空でなけ
% れば key を，key が空なら(そこに参照しているものの表題が入っているはずだから)
% booktitle フィールドを使う．

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
 	    { booktitle is.kanji.str$
 		{ booktitle }



 		{ booktitle }



 	       if$
 	    }
	  if$
	}

	{ "in " key * }

      if$
    }
    { title is.kanji.str$
 	{" " format.crossref.editor * }

 	{"in " format.crossref.editor * }

      if$
    }
  if$
  " \cite{" * crossref * "}" *
}

% ここから .BIB ファイル中に書かれる可能性のあるエントリの型(ARTICLE とか
% BOOK とか)毎に，関数を定義する．これらの関数が .BBL ファイルに出力を行う．
% これらの関数の定義は READ コマンドより前になければならない．さらにスタイル
% 設計者としては，未定義の型用に default.type という関数も定義する必要がある．
% 注意: 以下で示されているフィールドの順番は(inbook, proceedingsで特に
%       断ってない限り)，出力される順番に並んでいる．
%
% 学会誌の形式に合わせてコードが修正されているので，アルゴリズムとは必ずしも
% 一致しない．
%
% article 関数は ARTICLE 用であり，他の ARTICLE を文献リスト内参照してよい．
%	必須: author, title, journal, year
%	任意: volume, number, pages, month, note
%
% article ==
%  BEGIN
%	output.bibitem
%	output.check(format.authors,"author")
%	new.block
%	output.check(format.title,"title")
%	new.block
%	if missing$(crossref) then
%	    output.check(emphasize(journal),"journal")
%	    output(format.vol.num.pages)
%	    output.check(format.date,"year")
%       else
%	    output.nonnull(format.article.crossref)
%	    output(format.pages)
%	fi
%	new.block
%	output(note)
%	fin.entry
%  END
%
% book 関数は本全体の参照用．BOOK では他の BOOK を文献リスト内参照してよい．
%	必須: author or editor, title, publisher, year
%	任意: volume or number, series, address, edition, month, note
%             0 が 1 なら，pages も任意フィールド
%
% book ==
%  BEGIN
%	if empty$(author) then output.check(format.editors,"author and editor")
%	else	output.check(format.authors,"author")
%		if missing$(crossref) then
%		    either.or.check("author and editor",editor)
%		fi
%	fi
%	new.block
%	output.check(format.btitle,"title")
%	if missing$(crossref) then
%	    output(format.bvolume)
%	    new.block
%	    output(format.number.series)
%	    new.sentence
%	    output.check(publisher,"publisher")
%	    output(address)
%       else
%	    new.block
%	    output.nonnull(format.book.crossref)
%	fi
%	output(format.edition)
% #if    0
%        output(pages)
% #endif 0
%	output.check(format.date,"year")
%	new.block
%	output(note)
%	fin.entry
%  END
%
% 他のエントリ関数も同じような物なので，コメントバージョンはない．
% 情報処理学会英文論文誌では volume, number, year, pages の順で出力する．

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block

  format.title "title" output.check
%  new.block
  blank.sep
  crossref missing$
    { journal emphasize "journal" output.check

      format.vol.num.pages output
      format.date "year" output.check

}
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$

  new.block
  note output
  fin.entry
}



FUNCTION {book}
{ output.bibitem

  author empty$
     { format.editors "editor" output.check
       blank.sep
       new.sentence
       format.btitle "title" output.check
       blank.sep
%       new.sentence
     }
     { format.authors "author" output.check
       new.block
       format.btitle "title" output.check
       blank.sep
%  format.editors output
%       new.block

     }
%    { format.editors "author and editor" output.check }
%    { format.authors output.nonnull
%      crossref missing$
%	{ "author and editor" editor either.or.check }
%	'skip$
%      if$
%    }
  if$
  crossref missing$
    { 
       author empty$
          {
             new.block
%              blank.sep
  
           } 
          { 
             format.in.ed.editors output
%             new.block
%              blank.sep
          }
       if$
      format.bvolume output
      new.block
      format.number.series output
      series empty$
      {
         new.sentence
      }
      {
         new.block
      }
      if$
      publisher "publisher" output.check
     format.paddress output
%      address output
%      new.block
      blank.sep
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

% booklet は製本されてはいるが，出版社，スポンサー機関名のないもの
%	必須: title
%	任意: author, howpublished, address, month, year, note

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  blank.sep
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output

  new.block
  note output
  fin.entry
}

% conference タイプについては inproceedings を参照せよ．

% inbook は本の１部(章，節 and/or ページ範囲)を参照するためのものであり，
% BOOK を文献リスト内参照していてもよい． volume フィールドがない場合には，
% type フィールドの情報が number や series よりも前に並べられる．
%	必須: author or editor, title, chapter and/or pages, publisher,year
%	任意: volume or number, series, type, address, edition, month, note

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output

      format.chapter.pages "chapter and pages" output.check

      new.block
      format.number.series output

%      new.block
      new.sentence
      publisher "publisher" output.check
      format.paddress output
      new.block
    }

    { format.chapter.pages "chapter and pages" output.check

      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check


  new.block
  note output
  fin.entry
}

% INCOLLECTION は INBOOK と同じようなものではあるが，参照しているものが
% それ固有の表題を持つものである(たぶん全体の編者もある)．
% INCOLLECTION は BOOK を文献リスト内参照してもよい． 
%	必須: author, title, booktitle, publisher, year
%	任意: editor, volume or number, series, type, chapter, pages,
%			address, edition, month, note

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  blank.sep
%  new.block
  crossref missing$
    { format.in.ed.booktitle.incoll output
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.block
      publisher "publisher" output.check
      format.paddress output
      new.block
      format.edition output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$

  new.block
  note output
  fin.entry
}

% INPROCEEDINGS は会議の論文/予稿集に載っている論文で，論文/予稿集を文献リスト
% 内参照してもよい．address フィールドがなければ month (&year) が note の直前
% 置かれる．
%	必須: author, title, booktitle, year
%	任意: editor, volume or number, series, pages, address, month,
%	      organization, publisher, note

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  blank.sep
%  new.block
  crossref missing$
%    { format.in.ed.booktitle.incoll output
    { format.in.ed.booktitle.inpro "booktitle" output.check
      format.vol.num.pages output
      new.block
      address empty$
	{ organization publisher new.sentence.checkb
          new.block
	  organization output
	  mid.sentence 'output.state :=
          new.block
	  publisher output
	  format.date "year" output.check
	}
	{ address output
          blank.sep
	  format.date "year" output.check
          new.block
	  organization output
	  mid.sentence 'output.state :=
          new.block
  publisher output
	}
      if$
%    { format.in.ed.booktitle.incoll output
%      format.bvolume output
%      format.number.series output
%      format.chapter.pages output
%      new.block
%      publisher "publisher" output.check
%      format.paddress output
%      new.block
%      format.edition output
%      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
%  new.block
  note output
  fin.entry
}

%FUNCTION {inproceedings}
%{ output.bibitem
%  format.authors "author" output.check
%  new.block
%  format.title "title" output.check
%%  blank.sep
%%  new.block
%  crossref missing$
%    { format.in.ed.booktitle "booktitle" output.check
%      format.vol.num.pages output
%%      format.number.series output
%%      format.pages output
%      new.block
%      address empty$
%	{ organization publisher new.sentence.checkb
%          new.block
%	  organization output
%	  mid.sentence 'output.state :=
%          new.block
%	  publisher output
%	  format.date "year" output.check
%	}
%	{ address output
%          blank.sep
%	  format.date "year" output.check
%          new.block
%	  organization output
%	  mid.sentence 'output.state :=
%          new.block
%	  publisher output
%	}
%      if$
%    }
%    { format.incoll.inproc.crossref output.nonnull
%      format.pages output
%    }
%  if$
%  new.block
%  note output
%  fin.entry
%}

% conference 関数は Scribe との互換性のためにある．

FUNCTION {conference} { inproceedings }

% manual はマニュアル．
%	必須: title
%	任意: author, organization, address, edition, month, year, note

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull
	  address output
	}
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
	{ address new.block.checka
	  address output
	}
	'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output

  new.block
  note output
  fin.entry
}

% mastersthesis は修士論文
%	必須: author, title, school, year
%	任意: type, address, month, note

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
%  new.block
  blank.sep
  "修士論文" format.thesis.type output.nonnull

  school "school" output.check
  address output
  format.date "year" output.check

  new.block
  note output
  fin.entry
}

% misc は他のどれにもあてはまらない物
%	必須: 任意フィールドの少なくとも１つ
%	任意: author, title, howpublished, month, year, note

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  blank.sep
  howpublished new.block.checka
  howpublished output
  format.date output

  new.block
  note output
  fin.entry
  empty.misc.check
}

% phdthesis(博士論文) は mastersthesis のような物．
%	必須: author, title, school, year
%	任意: type, address, month, note

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
%  new.block
  blank.sep
  "Ph.D thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check

  new.block
  note output
  fin.entry
}

% proceedings は会議の論文/予稿集である．
% organization フィールドがあって， editor フィールドがない時には，
% organization フィールドが任意フィールドの最初のものとして使われる
% (最初のブロックを空にはしないようにする）．
% address フィールドがなければ，month (& year) が note の直前に並ぶ．
%	必須: title, year
%	任意: editor, volume or number, series, address, month,
%	      organization, publisher, note

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  blank.sep
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
	{ publisher new.sentence.checka }
	{ organization publisher new.sentence.checkb
	  organization output
	}
      if$
      publisher output
      format.date "year" output.check

    }
    { address output.nonnull
      format.date "year" output.check


      new.block

      editor empty$
	'skip$
	{ organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

% techreport はテクニカルレポート
%	必須: author, title, institution, year
%	任意: type, number, address, month, note

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  blank.sep
%  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check

  new.block
  note output
  fin.entry
}

% unpublished は出版されていないもの．
%	必須: author, title, note
%	任意: month, year

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  blank.sep
%  new.block
  note "note" output.check
  format.date output
  fin.entry
}

% 分類不明のエントリに対しては `misc' を使う．(J)BibTeX は警告を出す．

FUNCTION {default.type} { misc }

% スタイルで異なるかも知れないが，一般的なマクロが以下に並んでいる．
% 利用者はこれらのマクロを使うのが望ましい．
%
% 月の名前はフルスペルか省略形で書く．



MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"March"}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sept."}

MACRO {sept} {"Sept."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}



% 論文誌名はフルスペルか省略形で表示する．省略形は ACM の出版物にある形．
% これとまったく違うセットの省略形を使う場合には，その定義のみからなる
% .bib ファイルを作るのが一番いいだろう．そうすれば利用者は \bibliography
% コマンドの１番目の引数としてそれを指定して，これらを取り込める．



MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Softw. Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Programming"}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Gr."}

MACRO {toms} {"ACM Trans. Math. Softw."}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}

MACRO {tcs} {"Theoretical Comput. Sci."}

MACRO {tieice} {"信学論"}
MACRO {tipsj}  {"情報処理学会論文誌"}
MACRO {jipsj}  {"J.~Info. Proc. Soc. of Japan"}
MACRO {jorsj}  {"Journal of the O. R. Society of Japan"}



% .BBL ファイルのエントリを読み込む

READ

% 読み込まれた文献のデータが漢字のものかどうかチェックしてフラグを設定する．
% ASCII 版の 0.98 用のものを修正した．

FUNCTION {set.is.kanji.entry}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}

ITERATE {set.is.kanji.entry}

% sortify 関素は引数を purify$ した後に小文字に変換する．ソートのため，
% あるいはソート後にラベルを作る時に使われる．
%
% chop.word(w,len,s) は s そのものか，あるいは s の最初の len 文字が w と
% 等しければ(この比較は関数の定義の3行目で行われる w より後ろの s の
% 部分文字列を返す





% 以下の長いコメントは文字列ラベルの場合のみにあてはまる．
%
% format.lab.names 関数は名前の von と last パートの頭文字を使って短いラベル
% を作る(名前の数が４以上の場合には３つで切り，"+" を肩付きで加える．名前が
% 複数あり，最後が "others" である場合も同様に "+" を付ける）．
% 名前が１つしかなく，von と last パートからなる名前トークンが１つしかないと，
% ("Knuth" は１つ，"Brinch Hansen"は２つ) 姓(last name)の頭３文字からラベルを
% 作る．et.al.char.used は必要に応じて LaTeX マクロを書き出すために，"+" が
% 使われたかどうかを保持する論理型の変数である．
% 
% 漢字著者名の場合には yomi フィールドの情報を使って上と同様にラベルを作る．
% yomi フィールドがなければ，第一著者の姓のみからラベルを作る．
%
% format.lab.names(s) ==
%  BEGIN
%    if not empty$(yomi) then s := yomi fi
%    if is.kanji.str$(s) then return 第一著者の姓 fi
%    else do
%	numnames := num.names$(s)
%	if numnames > 1 then
%	    if numnames > 4 then
%		namesleft := 3
%	    else
%		namesleft := numnames
%	    nameptr := 1
%	    nameresult := ""
%	    while namesleft > 0
%	      do
%		if (name_ptr = numnames) and
%		     format.name$(s, nameptr, "{ff }{vv }{ll}{ jj}") = "others"
%		   then nameresult := nameresult * "{\etalchar{+}}"
%			et.al.char.used := true
%		   else nameresult := nameresult *
%				format.name$(s, nameptr, "{v{}}{l{}}")
%		nameptr := nameptr + 1
%		namesleft := namesleft - 1
%	      od
%	    if numnames > 4 then
%		nameresult := nameresult * "{\etalchar{+}}"
%		et.al.char.used := true
%	else
%	    t := format.name$(s, 1, "{v{}}{l{}}")
%	    if text.length$(t) < 2 then	% there's just one name-token
%		nameresult := text.prefix$(format.name$(s,1,"{ll}"),3)
%	    else
%		nameresult := t
%	    fi
%	fi
%	return nameresult
%    od
%  END
%
% ラベルの主要部分を作る時にどのフィールドに注目するかはエントリの型で異なる．
% これによって，どの型でも同じ情報を使う(例えば author, editor, key の順に使う)
% 場合に比べて，LaTeX book で述べられている「無視される」フィールドが本当に
% 「無視できる」ようになっている．MISC の判定は calc.label 関数中の if の
%  最後の else 部に置かれているから，データベース中の正しくないエントリ型でも
% ちゃんと処理できるようになっている．
%
% フィールドを見ていく順番は４つあるが，それぞれに対応した補助関数が用意されて
% いる．最初の関数は先ず author フィールドを調べ，必要な場合には key フィールド
% を調べる．他の３つの補助関数も同じようなものであるが，最初に２つのフィールド
% を調べ，その後に key フィールドを調べるようになっていたり，key フィールド
% を organization フィールドより先に調べるような形になっているのもある．
% (key が先なのはラベルに対しての話で，ソート用のラベルではないことに注意）．
%
% calc.label 関数は以下のようにしてエントリの予備的なラベルを作る．
% (どのフィールドが空かによるが，また organization 中の "The"は無視するが)
% author あるいは editor あるいは organization から３文字取り出し(これらが
% 漢字の場合には，yomi フィールドが空でなければ yomi フィールドを author,
% editor, organization の代わりに使って３文字取り出し，空ならば２漢字取り出し)
% て作ったものの後ろに year の最後の２文字を付け加える．必要な author, editor,
% organization, key がなければエラーであるが，その場合には citt$ の最初の
% ３文字を使う． 
%
% 得られるラベルの year 部分には purify$ が適用されているが， name 部分には
% purify$ は適用されていない．(year に対してpurify$ を適用するので，これを利用
% して利用者はソート関数をだまして，順番を自分の都合の良いようにできる）．
%
% これらの関数ではソートで使うラベルも作成する．
%
% 最終的なラベルには区別のために 'a', 'b' などを後ろにつける必要もあるが，
% この extra.label はソートした後で作る．
%
% calc.label ==
%  BEGIN
%	if type$ = "book" or "inbook" then
%	    author.editor.key.label
%	else if type$ = "proceedings" then
%	    editor.key.organization.label
%	else if type$ = "manual" then
%	    author.key.organization.label
%	else
%	    author.key.label
%	fi fi fi
%	label := label * substring$(purify$(field.or.null(year)), -1, 2)
%		% assuming we will also sort, we calculate a sort.label
%	sort.label := sortify(label), but use the last four, not two, digits
%  END



% ソーティングでは presort を各々のエントリに対して実行することで sortkey
% を求める．presort キーには複数のブランクで区切られた sortify された
% いくつかの文字列が含まれる．これによって "brinch  per" の方が
% "brinch hansen  per" より前になる．
%
% ここで使われているフィールド群は以下の通り．文字列ラベルの場合には
% (calc.label で求めた) sort.label, 続いてエントリの型あるいは何が欠けているか
% で異なるが，著者名(編者，先頭の "The" を除いた機関名のこともある)または
% key フィールド，次が年，そして(先頭の "The ", "A ", or "An " を除いた)
% 表題の一部分である．.
% 名前は Von Last First Junior のようにフォーマットされる．
% 名前の断片は("brinch hansen")のように１つの空白で区切られ，名前の構成要素は
% (von と姓の部分を除いて)２つの空白で区切られ，複数の名前の間には３つの空白
% が挿入され，名前と年(文字列ラベルの場合にはラベルと名前）の間には
% ４つの空白が挿入され，また年と表題の間にも４つの空白が挿入される．
%
% sort.format.names 関数は (J)BibTeX の名前形式で書かれた引数をとり，
% 上述の形式の "  " で区切られた文字列を返す． format.namesとほとんど同じ．
%
%


% この注釈はソートされた文字列ラベルを作る時のみあてはまる．
%
% 文字列ラベルの最終ステージであり，必要に応じて 'a', 'b' などを
% 付加する．2つのパスからなる． 'b', 'c' を付加するための前向きパスと，
% 'a' を付加するための後向きパスからなる．('b' がなければ'a'は付加する
% 必要はない)
% "thebibliography"環境のために width$ で計って最も長いラベルを求めておく．
%
% VAR: longest.label, last.sort.label, next.extra: string
%      longest.label.width, last.extra.num: integer
%
% initialize.longest.label ==
%  BEGIN
%	longest.label := ""
%	last.sort.label := int.to.chr$(0)
%	next.extra := ""
%	longest.label.width := 0
%	last.extra.num := 0
%  END
%
% forward.pass ==
%  BEGIN
%	if last.sort.label = sort.label then
%	    last.extra.num := last.extra.num + 1
%	    extra.label := int.to.chr$(last.extra.num)
%	else
%	    last.extra.num := chr.to.int$("a")
%	    extra.label := ""
%	    last.sort.label := sort.label
%	fi
%  END
%
% reverse.pass ==
%  BEGIN
%	if next.extra = "b" then
%	    extra.label := "a"
%	fi
%	label := label * extra.label
%	if width$(label) > longest.label.width then
%	    longest.label := label
%	    longest.label.width := width$(label)
%	fi
%	next.extra := extra.label
%  END




% 数字ラベルを求める．ソートされた順番，あるいは元の順番で処理する．
% "thebibliography" environment で必要な情報である，
% width$ で計って最も長いラベルも同時に求めておく．

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}



% .BBL ファイルに書き出す準備が整った．
% 先ず文字列ラベルで省略された名前を示すのに使う LaTeX マクロを必要に
% 応じて書きだし，次にデータベース中の `preamble' コマンドの中身を書き出す．
% そして
%     \begin{thebibliography}{...}
% を書き出す．ここで `...'は width$ で計算して最も長いラベルである．

FUNCTION {begin.bib}

{ preamble$ empty$

    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

% 全てのエントリを出力する．

ITERATE {call.type$}

% 最後に `\end{thebibliography}' コマンドを書き出しておしまい！

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
