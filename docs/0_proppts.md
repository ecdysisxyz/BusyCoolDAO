# MCBOT SimpleDAO Prompts

1. 
DAOとは何ですか？400字以内で説明してください
また、どのようなスマートコントラクトの関数が列挙できますか？
simple-daoの参考実装はこれです (https://raw.githubusercontent.com/ecdysisxyz/simple-dao/main/src/simple-dao/functions/Propose.sol)

2. 以下が今日の手順です。
・SimpleDAOを参考にユースケース図を書く（あるいはAIにDAOが持つ振る舞いを聞く）
・MCBOTを用いてER図のMermaid記法の設計を得る
・MCBOTを用いてDAOそのものとProposalの状態遷移図を書く（isApprovedなど）
・MCBOTを用いて関数毎の、状態毎のフローチャート図を書く
・MCBOTを用いてER図からSchema .solを生成する
・MCBOTを用いてフローチャート図に対応する関数を生成する
・それらを統合してコンパイルを正常に終了させる

覚えておいてください


3. ER図を書きたいです。

エンティティ同士のリレーションを暗示するために親子構造を示す複数形のフィールドは必ず含めるようにしてください。

ただし、ProposalのExecute関数は数値をインクリメントするだけのデモにしたいので、DAOに数値型の状態を持たせればそれでいいです。

ファクトリーパターンは不要です。DAO１つにしか関心がありません

meta contractのSchema.sol を将来的に出力したいのですが、まずはER図としては、どんなデータ構造になりそうですか？


4. そのER図から Schema.sol を生成してみてください



5. 状態遷移図が欲しいです。

特に、DAOについてはPause状態、同時に２つ以上の提案が実施されてはいけない状態(=Busy)、新規メンバーが追加された後１日間のクールタイムを含めたいです。

Proposalについては、Expired, Executed、Approvedの状態は管理したいです。MermaidではENUMが使えないみたいなので、数値型 Proposal.state でいいです。


6. 
状態遷移が複雑化したので、ER図を改善してください。また Scheme.sol も生成してください。
ただし、MermaidではENUMが使えないみたいなので、コメントアウトでuint型のproposal stateにメタ情報を書いておいて. Scheme.sol も再度生成しておいてください。


7.

addMember, removeMember, propose, vote, tally, execute関数毎のフローチャート図が欲しいです。
まずその関数が関心のある状態に関するチェックを入れて、次に入力値に関するチェックを入れて、状態遷移を行なってください。

例えばDAO paused cooldown busyチェックは必須です。cooldown, busy状態は新規proposeのみを禁止します。
個別のProposalに関係する処理はexpired, approved, executedの管理が必須です。

例えばアクセス管理の例は以下です。
addMember onlyOwner
removeMember onlyOwner
propose onlyMember
vote onlyMember
tally public
execute public

8.

addMember, removeMember, propose, vote, tally, execute

これらの関数をmeta contractのfunctionとして実装してください.simple-daoの参考実装はこれです (https://raw.githubusercontent.com/ecdysisxyz/simple-dao/main/src/simple-dao/functions/Propose.sol)

import "../storage/Storage.sol";

を使用して、Schema.sol で規定されたデータ構造をストレージ変数として呼び出し、１関数１ファイルの制約を守って実装し直してください。