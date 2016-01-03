" Mathematica syntax for vim

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=48-57,a-z,A-Z,$

syntax case match

" Named Character: \[...]
syntax cluster mmaCharName contains=mmaCNLatinExt,mmaCNGreek,mmaCNHebrew,mmaCNDoubleStruck,mmaCNGothic,mmaCNScript,mmaCNFormal,mmaCNOperator,mmaCNRelation,mmaCNBracket,mmaCNMath,mmaCNArrow,mmaCNShape,mmaCNRaw,mmaCNText,mmaCNNonPrint,mmaCNKey,mmaCNUnit,mmaCNAstro,mmaCNGames,mmaCNMusic,mmaCNMisc

syntax region mmaNamedChar matchgroup=mmaNCBracket start='\\\[' end='\]' keepend contains=@mmaCharName,mmaNCError

syntax match mmaNCError '.' contained
syntax match mmaNCError '\\\[\]'

syntax keyword mmaCNLatinExt contained AGrave AAcute AHat ATilde ACup ADoubleDot ABar ARing AE CAcute CHacek CCedilla EGrave EAcute EHat ECup EDoubleDot EBar IGrave IAcute IHat ICup IDoubleDot Eth LSlash NTilde OGrave OAcute OHat OTilde ODoubleDot ODoubleAcute OSlash SHacek UGrave UAcute UHat UDoubleDot UDoubleAcute YAcute YDoubleDot Thorn SZ DHacek EHacek NHacek OE RHacek THacek URing ZHacek
syntax keyword mmaCNLatinExt contained CapitalAGrave CapitalAAcute CapitalAHat CapitalATilde CapitalACup CapitalADoubleDot CapitalABar CapitalARing CapitalAE CapitalCAcute CapitalCHacek CapitalCCedilla CapitalEGrave CapitalEAcute CapitalEHat CapitalECup CapitalEDoubleDot CapitalEBar CapitalIGrave CapitalIAcute CapitalIHat CapitalICup CapitalIDoubleDot CapitalEth CapitalLSlash CapitalNTilde CapitalOGrave CapitalOAcute CapitalOHat CapitalOTilde CapitalODoubleDot CapitalODoubleAcute CapitalOSlash CapitalSHacek CapitalUGrave CapitalUAcute CapitalUHat CapitalUDoubleDot CapitalUDoubleAcute CapitalYAcute CapitalThorn CapitalDHacek CapitalEHacek CapitalNHacek CapitalOE CapitalRHacek CapitalTHacek CapitalURing CapitalZHacek

syntax keyword mmaCNGreek contained Alpha Beta Gamma Delta Epsilon Zeta Eta Theta Iota Kappa Lambda Mu Nu Xi Omicron Pi Rho Sigma Tau Upsilon Phi Chi Psi Omega
syntax keyword mmaCNGreek contained CapitalAlpha CapitalBeta CapitalGamma CapitalDelta CapitalEpsilon CapitalZeta CapitalEta CapitalTheta CapitalIota CapitalKappa CapitalLambda CapitalMu CapitalNu CapitalXi CapitalOmicron CapitalPi CapitalRho CapitalSigma CapitalTau CapitalUpsilon CapitalPhi CapitalChi CapitalPsi CapitalOmega
syntax keyword mmaCNGreek contained CurlyEpsilon CurlyTheta CurlyKappa CurlyPi CurlyRho FinalSigma CurlyPhi CurlyCapitalUpsilon
syntax keyword mmaCNGreek contained Digamma Koppa Stigma Sampi CapitalDigamma CapitalKoppa CapitalStigma CapitalSampi

syntax keyword mmaCNHebrew contained Aleph Bet Gimel Dalet

syntax keyword mmaCNDoubleStruck contained DoubleStruckA DoubleStruckB DoubleStruckC DoubleStruckD DoubleStruckE DoubleStruckF DoubleStruckG DoubleStruckH DoubleStruckI DoubleStruckJ DoubleStruckK DoubleStruckL DoubleStruckM DoubleStruckN DoubleStruckO DoubleStruckP DoubleStruckQ DoubleStruckR DoubleStruckS DoubleStruckT DoubleStruckU DoubleStruckV DoubleStruckW DoubleStruckX DoubleStruckY DoubleStruckZ
syntax keyword mmaCNDoubleStruck contained DoubleStruckCapitalA DoubleStruckCapitalB DoubleStruckCapitalC DoubleStruckCapitalD DoubleStruckCapitalE DoubleStruckCapitalF DoubleStruckCapitalG DoubleStruckCapitalH DoubleStruckCapitalI DoubleStruckCapitalJ DoubleStruckCapitalK DoubleStruckCapitalL DoubleStruckCapitalM DoubleStruckCapitalN DoubleStruckCapitalO DoubleStruckCapitalP DoubleStruckCapitalQ DoubleStruckCapitalR DoubleStruckCapitalS DoubleStruckCapitalT DoubleStruckCapitalU DoubleStruckCapitalV DoubleStruckCapitalW DoubleStruckCapitalX DoubleStruckCapitalY DoubleStruckCapitalZ
syntax keyword mmaCNDoubleStruck contained DoubleStruckZero DoubleStruckOne DoubleStruckTwo DoubleStruckThree DoubleStruckFour DoubleStruckFive DoubleStruckSix DoubleStruckSeven DoubleStruckEight DoubleStruckNine

syntax keyword mmaCNGothic contained GothicA GothicB GothicC GothicD GothicE GothicF GothicG GothicH GothicI GothicJ GothicK GothicL GothicM GothicN GothicO GothicP GothicQ GothicR GothicS GothicT GothicU GothicV GothicW GothicX GothicY GothicZ
syntax keyword mmaCNGothic contained GothicCapitalA GothicCapitalB GothicCapitalC GothicCapitalD GothicCapitalE GothicCapitalF GothicCapitalG GothicCapitalH GothicCapitalI GothicCapitalJ GothicCapitalK GothicCapitalL GothicCapitalM GothicCapitalN GothicCapitalO GothicCapitalP GothicCapitalQ GothicCapitalR GothicCapitalS GothicCapitalT GothicCapitalU GothicCapitalV GothicCapitalW GothicCapitalX GothicCapitalY GothicCapitalZ
syntax keyword mmaCNGothic contained GothicZero GothicOne GothicTwo GothicThree GothicFour GothicFive GothicSix GothicSeven GothicEight GothicNine

syntax keyword mmaCNScript contained ScriptA ScriptB ScriptC ScriptD ScriptE ScriptF ScriptG ScriptH ScriptI ScriptJ ScriptK ScriptL ScriptM ScriptN ScriptO ScriptP ScriptQ ScriptR ScriptS ScriptT ScriptU ScriptV ScriptW ScriptX ScriptY ScriptZ
syntax keyword mmaCNScript contained ScriptCapitalA ScriptCapitalB ScriptCapitalC ScriptCapitalD ScriptCapitalE ScriptCapitalF ScriptCapitalG ScriptCapitalH ScriptCapitalI ScriptCapitalJ ScriptCapitalK ScriptCapitalL ScriptCapitalM ScriptCapitalN ScriptCapitalO ScriptCapitalP ScriptCapitalQ ScriptCapitalR ScriptCapitalS ScriptCapitalT ScriptCapitalU ScriptCapitalV ScriptCapitalW ScriptCapitalX ScriptCapitalY ScriptCapitalZ
syntax keyword mmaCNScript contained ScriptDotlessI ScriptDotlessJ
syntax keyword mmaCNScript contained ScriptZero ScriptOne ScriptTwo ScriptThree ScriptFour ScriptFive ScriptSix ScriptSeven ScriptEight ScriptNine

syntax keyword mmaCNFormal contained FormalA FormalB FormalC FormalD FormalE FormalF FormalG FormalH FormalI FormalJ FormalK FormalL FormalM FormalN FormalO FormalP FormalQ FormalR FormalS FormalT FormalU FormalV FormalW FormalX FormalY FormalZ
syntax keyword mmaCNFormal contained FormalCapitalA FormalCapitalB FormalCapitalC FormalCapitalD FormalCapitalE FormalCapitalF FormalCapitalG FormalCapitalH FormalCapitalI FormalCapitalJ FormalCapitalK FormalCapitalL FormalCapitalM FormalCapitalN FormalCapitalO FormalCapitalP FormalCapitalQ FormalCapitalR FormalCapitalS FormalCapitalT FormalCapitalU FormalCapitalV FormalCapitalW FormalCapitalX FormalCapitalY FormalCapitalZ
syntax keyword mmaCNFormal contained FormalAlpha FormalBeta FormalGamma FormalDelta FormalEpsilon FormalZeta FormalEta FormalTheta FormalIota FormalKappa FormalLambda FormalMu FormalNu FormalXi FormalOmicron FormalPi FormalRho FormalSigma FormalTau FormalUpsilon FormalPhi FormalChi FormalPsi FormalOmega
syntax keyword mmaCNFormal contained FormalCapitalAlpha FormalCapitalBeta FormalCapitalGamma FormalCapitalDelta FormalCapitalEpsilon FormalCapitalZeta FormalCapitalEta FormalCapitalTheta FormalCapitalIota FormalCapitalKappa FormalCapitalLambda FormalCapitalMu FormalCapitalNu FormalCapitalXi FormalCapitalOmicron FormalCapitalPi FormalCapitalRho FormalCapitalSigma FormalCapitalTau FormalCapitalUpsilon FormalCapitalPhi FormalCapitalChi FormalCapitalPsi FormalCapitalOmega
syntax keyword mmaCNFormal contained FormalCurlyEpsilon FormalCurlyTheta FormalCurlyKappa FormalCurlyPi FormalCurlyRho FormalFinalSigma FormalCurlyPhi FormalCurlyCapitalUpsilon
syntax keyword mmaCNFormal contained FormalDigamma FormalKoppa FormalStigma FormalSampi FormalCapitalDigamma FormalCapitalKoppa FormalCapitalStigma FormalCapitalSampi

syntax keyword mmaCNOperator contained Times CenterDot Divide Sqrt PlusMinus MinusPlus Cross Wedge Vee Sum Product Coproduct TensorProduct TensorWedge PermutationProduct
syntax keyword mmaCNOperator contained Integral ContourIntegral ClockwiseContourIntegral CounterClockwiseContourIntegral DoubleContourIntegral
syntax keyword mmaCNOperator contained PartialD Del DifferentialD CapitalDifferentialD
syntax keyword mmaCNOperator contained And Or Not Xor Nand Nor Xnor ForAll Exists NotExists SuchThat
syntax keyword mmaCNOperator contained CircleTimes CirclePlus CircleMinus CircleDot Cup Cap Star Union Intersection UnionPlus Backslash SquareUnion SquareIntersection
syntax keyword mmaCNOperator contained Transpose Conjugate ConjugateTranspose HermitianConjugate
syntax keyword mmaCNOperator contained Divides VerticalBar DoubleVerticalBar NotVerticalBar NotDoubleVerticalBar

syntax keyword mmaCNRelation contained Equal LongEqual TildeEqual EqualTilde TildeFullEqual Tilde TildeTilde HumpEqual HumpDownHump Congruent CupCap Equivalent
syntax keyword mmaCNRelation contained NotEqual NotEqualTilde NotTildeEqual NotTildeFullEqual NotTilde NotTildeTilde NotHumpEqual NotHumpDownHump NotCongruent NotCupCap
syntax keyword mmaCNRelation contained DotEqual Proportional Proportion
syntax keyword mmaCNRelation contained LessEqual LessSlantEqual LessFullEqual LessTilde GreaterEqual GreaterSlantEqual GreaterFullEqual GreaterTilde
syntax keyword mmaCNRelation contained LessGreater GreaterLess LessEqualGreater GreaterEqualLess
syntax keyword mmaCNRelation contained NotLess NotLessEqual NotLessSlantEqual NotLessFullEqual NotLessTilde NotGreater NotGreaterEqual NotGreaterSlantEqual NotGreaterFullEqual NotGreaterTilde
syntax keyword mmaCNRelation contained NotLessGreater NotGreaterLess
syntax keyword mmaCNRelation contained Subset SubsetEqual Superset SupersetEqual NotSubset NotSubsetEqual NotSuperset NotSupersetEqual
syntax keyword mmaCNRelation contained Element ReverseElement NotElement NotReverseElement
syntax keyword mmaCNRelation contained SquareSubset SquareSubsetEqual SquareSuperset SquareSupersetEqual NotSquareSubset NotSquareSubsetEqual NotSquareSuperset NotSquareSupersetEqual
syntax keyword mmaCNRelation contained Precedes PrecedesEqual PrecedesSlantEqual PrecedesTilde Succeeds SucceedsEqual SucceedsSlantEqual SucceedsTilde
syntax keyword mmaCNRelation contained NotPrecedes NotPrecedesEqual NotPrecedesSlantEqual NotPrecedesTilde NotSucceeds NotSucceedsEqual NotSucceedsSlantEqual NotSucceedsTilde
syntax keyword mmaCNRelation contained LeftTriangle LeftTriangleEqual LeftTriangleBar RightTriangle RightTriangleEqual RightTriangleBar
syntax keyword mmaCNRelation contained NotLeftTriangle NotLeftTriangleEqual NotLeftTriangleBar NotRightTriangle NotRightTriangleEqual NotRightTriangleBar
syntax keyword mmaCNRelation contained LessLess GreaterGreater NestedLessLess NestedGreaterGreater NotLessLess NotGreaterGreater NotNestedLessLess NotNestedGreaterGreater

syntax keyword mmaCNBracket contained LeftAngleBracket LeftBracketingBar LeftDoubleBracket LeftDoubleBracketingBar LeftCeiling LeftFloor LeftAssociation LeftModified LeftSkeleton
syntax keyword mmaCNBracket contained RightAngleBracket RightBracketingBar RightDoubleBracket RightDoubleBracketingBar RightCeiling RightFloor RightAssociation RightModified RightSkeleton
syntax keyword mmaCNBracket contained OverBrace OverBracket OverParenthesis UnderBrace UnderBracket UnderParenthesis

syntax keyword mmaCNMath contained Angle MeasuredAngle RightAngle SphericalAngle Because Therefore Implies RoundImplies Colon Conditioned Distributed ConstantC Diameter DifferenceDelta DirectedEdge UndirectedEdge DiscreteRatio DiscreteShift DotlessI DotlessJ DoubledGamma DoubledPi EmptySet ExponentialE Function ImaginaryI ImaginaryJ Infinity Piecewise Rule RuleDelayed SystemsModelDelay VerticalSeparator VerticalTilde WeierstrassP

syntax keyword mmaCNArrow contained ShortLeftArrow ShortRightArrow LeftArrow RightArrow LongLeftArrow LongRightArrow LongLeftRightArrow LeftRightArrow UpArrow DownArrow ShortUpArrow ShortDownArrow UpDownArrow LowerLeftArrow LowerRightArrow UpperLeftArrow UpperRightArrow
syntax keyword mmaCNArrow contained DoubleLeftArrow DoubleRightArrow DoubleLongLeftArrow DoubleLongRightArrow DoubleLongLeftRightArrow DoubleLeftRightArrow DoubleUpArrow DoubleDownArrow DoubleUpDownArrow
syntax keyword mmaCNArrow contained LeftVector RightVector DownLeftVector DownRightVector LeftRightVector DownLeftRightVector LeftUpVector LeftDownVector RightDownVector RightUpVector LeftUpDownVector RightUpDownVector
syntax keyword mmaCNArrow contained LeftArrowRightArrow RightArrowLeftArrow DownArrowUpArrow UpArrowDownArrow ReverseEquilibrium Equilibrium UpEquilibrium ReverseUpEquilibrium
syntax keyword mmaCNArrow contained LeftArrowBar RightArrowBar UpArrowBar DownArrowBar LeftVectorBar RightVectorBar DownLeftVectorBar DownRightVectorBar LeftUpVectorBar LeftDownVectorBar RightDownVectorBar RightUpVectorBar
syntax keyword mmaCNArrow contained LeftTeeArrow RightTeeArrow UpTeeArrow DownTeeArrow LeftTeeVector RightTeeVector LeftUpTeeVector LeftDownTeeVector DownLeftTeeVector DownRightTeeVector RightUpTeeVector RightDownTeeVector LeftTee RightTee UpTee DownTee DoubleRightTee DoubleLeftTee
syntax keyword mmaCNArrow contained LeftPointer RightPointer UpPointer DownPointer FirstPage LastPage

syntax keyword mmaCNShape contained Square FilledSquare FilledSmallSquare FilledVerySmallSquare EmptySquare EmptySmallSquare EmptyVerySmallSquare GraySquare DottedSquare FilledRectangle EmptyRectangle
syntax keyword mmaCNShape contained FilledCircle SmallCircle FilledSmallCircle EmptyCircle EmptySmallCircle GrayCircle Diamond FilledDiamond EmptyDiamond SixPointedStar FivePointedStar
syntax keyword mmaCNShape contained FilledRightTriangle FilledLeftTriangle FilledUpTriangle FilledDownTriangle EmptyUpTriangle EmptyDownTriangle

syntax keyword mmaCNRaw contained RawAmpersand RawAt RawBackquote RawBackslash RawColon RawComma RawDash RawDollar RawDot RawDoubleQuote RawEqual RawEscape RawExclamation RawGreater RawLeftBrace RawLeftBracket RawLeftParenthesis RawLess RawNumberSign RawPercent RawPlus RawQuestion RawQuote RawReturn RawRightBrace RawRightBracket RawRightParenthesis RawSemicolon RawSlash RawSpace RawStar RawTab RawTilde RawUnderscore RawVerticalBar RawWedge

syntax keyword mmaCNText contained Dash LongDash Hyphen DiscretionaryHyphen Ellipsis CenterEllipsis VerticalEllipsis AscendingEllipsis DescendingEllipsis Bullet Paragraph Section Dagger DoubleDagger Checkmark OpenCurlyQuote CloseCurlyQuote OpenCurlyDoubleQuote CloseCurlyDoubleQuote DownQuestion DownExclamation LeftGuillemet RightGuillemet Hacek Breve DownBreve Cedilla Prime DoublePrime ReversePrime ReverseDoublePrime DoubleDot TripleDot FlLigature FiLigature Continuation EntityStart EntityEnd HorizontalLine VerticalLine NumberSign Placeholder SelectionPlaceholder SpaceIndicator RoundSpaceIndicator SkeletonIndicator SpanFromBoth SpanFromAbove SpanFromLeft

syntax keyword mmaCNNonPrint contained ThickSpace MediumSpace ThinSpace VeryThinSpace NegativeThinSpace NegativeThickSpace NegativeMediumSpace NegativeVeryThinSpace LetterSpace
syntax keyword mmaCNNonPrint contained NonBreakingSpace NoBreak IndentingNewLine DiscretionaryHyphen AlignmentMarker
syntax keyword mmaCNNonPrint contained InvisibleSpace InvisibleComma InvisibleApplication ImplicitPlus InvisiblePrefixScriptBase InvisiblePostfixScriptBase InvisibleTimes Null
syntax keyword mmaCNNonPrint contained DiscretionaryLineSeparator DiscretionaryPageBreakAbove DiscretionaryPageBreakBelow DiscretionaryParagraphSeparator LineSeparator ParagraphSeparator NewLine
syntax keyword mmaCNNonPrint contained AutoLeftMatch AutoOperand AutoPlaceholder AutoRightMatch AutoSpace

syntax keyword mmaCNKey contained AltKey CommandKey ControlKey DeleteKey EnterKey EscapeKey OptionKey ReturnKey SpaceKey SystemEnterKey TabKey CloverLeaf ReturnIndicator

syntax keyword mmaCNUnit contained Euro Sterling Yen Florin Cent Currency
syntax keyword mmaCNUnit contained Micro Mho Angstrom Degree HBar

syntax keyword mmaCNAstro contained Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
syntax keyword mmaCNAstro contained AriesSign TaurusSign GeminiSign CancerSign LeoSign VirgoSign LibraSign ScorpioSign SagittariusSign CapricornSign AquariusSign PiscesSign

syntax keyword mmaCNGames contained ClubSuit DiamondSuit HeartSuit SpadeSuit
syntax keyword mmaCNGames contained BlackBishop BlackKing BlackKnight BlackPawn BlackQueen BlackRook
syntax keyword mmaCNGames contained WhiteBishop WhiteKing WhiteKnight WhitePawn WhiteQueen WhiteRook

syntax keyword mmaCNMusic contained QuarterNote EighthNote BeamedEighthNote BeamedSixteenthNote Sharp Flat Natural

syntax keyword mmaCNMisc contained AliasDelimiter AliasIndicator CheckedBox Copyright ErrorIndicator FreakedSmiley HappySmiley NeutralSmiley SadSmiley WarningSign KernelIcon LightBulb MathematicaIcon RegisteredTrademark Trademark WatchIcon Wolf WolframLanguageLogo WolframLanguageLogoCircle

" Keywords:
syntax keyword mmaKeyConstant Pi E I EulerGamma GoldenRatio GoldenAngle Catalan Glaisher Khinchin Infinity

syntax keyword mmaKeyArith Plus Subtract Times Divide Power

syntax keyword mmaKeyElemFunc Exp Log Log2 Log10 Sqrt CubeRoot Surd
syntax keyword mmaKeyElemFunc Sin Cos Tan Csc Sec Cot ArcSin ArcCos ArcTan ArcCsc ArcSec ArcCot Sinc Degree
syntax keyword mmaKeyElemFunc Sinh Cosh Tanh Csch Sech Coth ArcSinh ArcCosh ArcTanh ArcCsch ArcSech ArcCoth

syntax keyword mmaKeySpecFunc Gamma Beta PolyGamma LogGamma Factorial Factorial2 Pochhammer Binomial Subfactorial FactorialPower Hyperfactorial GammaRegularized BetaRegularized InverseGammaRegularized InverseBetaRegularized BarnesG LogBarnesG
syntax keyword mmaKeySpecFunc Erf Erfc Erfi InverseErf InverseErfc DawsonF ExpIntegralE ExpIntegralEi LogIntegral FresnelS FresnelC FresnelF FresnelG SinIntegral CosIntegral SinhIntegral CoshIntegral
syntax keyword mmaKeySpecFunc HermiteH LaguerreL JacobiP GegenbauerC ChebyshevT ChebyshevU ZernikeR SphericalHarmonicY WignerD LegendreP LegendreQ
syntax keyword mmaKeySpecFunc BesselJ BesselY BesselI BesselK SphericalBesselJ SphericalBesselY HankelH1 HankelH2 SphericalHankelH1 SphericalHankelH2 AiryAi AiryAiPrime AiryBi AiryBiPrime ScorerGi ScorerGiPrime ScorerHi ScorerHiPrime KelvinBer KelvinBei KelvinKer KelvinKei StruveH StruveL AngerJ WeberE BesselJZero BesselYZero AiryAiZero AiryBiZero
syntax keyword mmaKeySpecFunc Hypergeometric2F1 HypergeometricPFQ MeijerG Hypergeometric1F1 HypergeometricU WhittakerM WhittakerW ParabolicCylinderD Hypergeometric0F1 Hypergeometric2F1Regularized HypergeometricPFQRegularized Hypergeometric1F1Regularized Hypergeometric0F1Regularized AppellF1
syntax keyword mmaKeySpecFunc EllipticK EllipticF EllipticE EllipticPi JacobiZeta ArithmeticGeometricMean InverseWeierstrassP EllipticNomeQ InverseEllipticNomeQ JacobiAmplitude
syntax keyword mmaKeySpecFunc JacobiSN JacobiCN JacobiDN JacobiCD JacobiCS JacobiDC JacobiDS JacobiNC JacobiND JacobiNS JacobiSC JacobiSD InverseJacobiSN InverseJacobiCN InverseJacobiDN InverseJacobiCD InverseJacobiCS InverseJacobiDC InverseJacobiDS InverseJacobiNC InverseJacobiND  InverseJacobiNS InverseJacobiSC InverseJacobiSD WeierstrassP WeierstrassPPrime WeierstrassSigma WeierstrassZeta InverseWeierstrassP EllipticTheta EllipticThetaPrime SiegelTheta NevilleThetaC NevilleThetaD NevilleThetaN NevilleThetaS EllipticExp EllipticExpPrime EllipticLog
syntax keyword mmaKeySpecFunc DedekindEta KleinInvariantJ ModularLambda SiegelTheta MittagLefflerE
syntax keyword mmaKeySpecFunc Zeta RiemannSiegelZ RiemannSiegelTheta StieltjesGamma RiemannXi ZetaZero PolyLog LerchPhi HurwitzZeta HurwitzLerchPhi DirichletBeta DirichletEta DirichletLambda PrimeZetaP
syntax keyword mmaKeySpecFunc MathieuS MathieuC MathieuSPrime MathieuCPrime MathieuCharacteristicA MathieuCharacteristicB MathieuCharacteristicExponent
syntax keyword mmaKeySpecFunc SpheroidalPS SpheroidalQS SpheroidalPSPrime SpheroidalQSPrime SpheroidalS1 SpheroidalS2 SpheroidalS1Prime SpheroidalS2Prime SpheroidalEigenvalue SpheroidalJoiningFactor SpheroidalRadialFactor
syntax keyword mmaKeySpecFunc QPochhammer QFactorial QBinomial QGamma QHypergeometricPFQ QPolyGamma

syntax keyword mmaKeyBoolean And Or Not Nand Nor Xor Xnor Equivalent Implies True False Boole

syntax keyword mmaKeyList List Part Span Table Array First Last Rest Most Take Drop TakeDrop TakeWhile UpTo
syntax keyword mmaKeyList Append Prepend Insert Delete AppendTo PrependTo Join Flatten
syntax keyword mmaKeyList Length Dimensions ArrayDepth LengthWhile

syntax keyword mmaKeyPlot Plot LogPlot LogLinearPlot LogLogPlot Plot3D ContourPlot ContourPlot3D SliceContourPlot3D DensityPlot DensityPlot3D SliceDensityPlot3D ParametricPlot ParametricPlot3D PolarPlot RevolutionPlot3D SphericalPlot3D NumberLinePlot RegionPlot RegionPlot3D
syntax keyword mmaKeyPlot StreamPlot ListStreamPlot LineIntegralConvolutionPlot ListLineIntegralConvolutionPlot VectorPlot ListVectorPlot StreamDensityPlot ListStreamDensityPlot VectorDensityPlot ListVectorDensityPlot VectorPlot3D ListVectorPlot3D SliceVectorPlot3D ListSliceVectorPlot3D
syntax keyword mmaKeyPlot ListPlot ListLinePlot ListStepPlot ListLogPlot ListLogLinearPlot ListLogLogPlot ListPolarPlot ListPlot3D ListPointPlot3D ListDensityPlot ListDensityPlot3D ListContourPlot ListContourPlot3D ListSliceDensityPlot3D ListSliceContourPlot3D ListCurvePathPlot ListSurfacePlot3D ArrayPlot ReliefPlot MatrixPlot DateListPlot DateListLogPlot TimelinePlot DateHistogram DateListStepPlot GraphPlot LayeredGraphPlot TreePlot

syntax keyword mmaKeyContext BeginPackage EndPackage Begin End

" Comment: (* ... *)
syntax region mmaComment start='(\*' end='\*)'

" String: "..."
" \" does not start a string
" \", \\\", \\\\\" ... does not end a string
syntax region mmaString start='\\\@<!"' skip='\\\@<!\\\%(\\\\\)*"' end='"' contains=mmaNamedChar

" Separators:
"syntax match mmaSeparator '\%(,\|;\|\\\@<!\[\|\]\|{\|}\)'
syntax match mmaSeparator '\%(,\|;\|\\\@<!\[\|\]\|{\|}\|(\*\@!\|)\)'

" Operators:
syntax match mmaOpArith '\%(+\|-\|\*\|/\|\.\|\^\)'

syntax match mmaOpAssign '\%(/:\|\^:=\|\^=\|:=\|+=\|-=\|\*=\|/=\|=\)'

syntax match mmaOpCompare '\%(===\|=!=\|==\|!=\|<=\|>=\|<\|>\)'

syntax match mmaOpReplace '\%(->\|:>\|//\.\|/\.\|/;\|?\|\.\.\.\|\.\.\)'

syntax match mmaOpFunc '\%(@@@\|@@\|//@\|/@\|//\|\~\|@\|##\|#[0-9]*\|&\)'

syntax match mmaOpString '\%(<>\|\~\~\)'

syntax match mmaOpLogic '\%(||\|&&\|!\)'

syntax match mmaOpOther '\%(::\|;;\|>>>\|>>\|<<\|%[0-9]\+\|%\+\)'

" Numbers:
syntax match mmaNumber '\<\d\+'

syntax match mmaFloat '\<\%(\d*\.\d\+\|\d\+\.\d*\)`\=\d*'

" Patterns:
syntax match mmaPattern '\([a-zA-Z][a-zA-Z0-9]*:\=\)\=_\{1,3\}\([a-zA-Z][a-zA-Z0-9]*\)\='

" Highlighting:

hi def link mmaComment Comment
hi def link mmaString String
hi def link mmaCharacter Character
hi def link mmaOperator Operator
hi def link mmaFunction Function
hi def link mmaError Error
hi def link mmaSeparator Delimiter
hi def link mmaNumber Number
hi def link mmaFloat Float
hi def link mmaPattern Macro

hi def link mmaNamedChar mmaCharacter
hi def link mmaNCBracket mmaCharacter
hi def link mmaCNLatinExt mmaCharacter
hi def link mmaCNGreek mmaCharacter
hi def link mmaCNHebrew mmaCharacter
hi def link mmaCNDoubleStruck mmaCharacter
hi def link mmaCNGothic mmaCharacter
hi def link mmaCNScript mmaCharacter
hi def link mmaCNFormal mmaCharacter
hi def link mmaCNOperator mmaCharacter
hi def link mmaCNRelation mmaCharacter
hi def link mmaCNBracket mmaCharacter
hi def link mmaCNMath mmaCharacter
hi def link mmaCNArrow mmaCharacter
hi def link mmaCNShape mmaCharacter
hi def link mmaCNRaw mmaCharacter
hi def link mmaCNText mmaCharacter
hi def link mmaCNNonPrint mmaCharacter
hi def link mmaCNKey mmaCharacter
hi def link mmaCNUnit mmaCharacter
hi def link mmaCNAstro mmaCharacter
hi def link mmaCNGames mmaCharacter
hi def link mmaCNMusic mmaCharacter
hi def link mmaCNMisc mmaCharacter

hi def link mmaKeyConstant mmaFunction
hi def link mmaKeyArith mmaFunction
hi def link mmaKeyElemFunc mmaFunction
hi def link mmaKeySpecFunc mmaFunction
hi def link mmaKeyBoolean mmaFunction
hi def link mmaKeyList mmaFunction
hi def link mmaKeyPlot mmaFunction
hi def link mmaKeyContext mmaFunction

hi def link mmaOpAssign mmaOperator
hi def link mmaOpCompare mmaOperator
hi def link mmaOpReplace mmaOperator
hi def link mmaOpArith mmaOperator
hi def link mmaOpFunc mmaOperator
hi def link mmaOpString mmaOperator
hi def link mmaOpLogic mmaOperator
hi def link mmaOpOther mmaOperator

hi def link mmaNCError mmaError

let b:current_syntax = "mma"

let &cpo = s:cpo_save
unlet s:cpo_save

