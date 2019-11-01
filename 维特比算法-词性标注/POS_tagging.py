import numpy as np

"""配置"""
PATH_TRAIN = 'train.txt'  # 训练数据
log = lambda p: np.log(p + 1e-9)
START = '<start>'  # 起始tag

"""数据读取、预处理"""
train = np.loadtxt(PATH_TRAIN, dtype=str, delimiter='/')

words = sorted(set(train[:, 0]))
tags = sorted(set(train[:, 1]))

W = len(words)  # 词汇量
T = len(tags)   # 词性种类数

word2id = {words[i]: i for i in range(W)}
tag2id = {tags[i]: i for i in range(T)}
id2tag = {i: tags[i] for i in range(T)}

"""HMM模型训练"""
emit_p = np.zeros((T, W))  # emission_probability
start_p = np.zeros(T)  # start_probability
trans_p = np.zeros((T, T))  # transition_probability

prev_tag = START  # 前一个tag
for word, tag in train:
    wid, tid = word2id[word], tag2id[tag]
    emit_p[tid][wid] += 1
    if prev_tag == START:
        start_p[tid] += 1
    else:
        trans_p[tag2id[prev_tag]][tid] += 1
    prev_tag = START if word == '.' else tag

# 频数 --> 概率对数
start_p = log(start_p / sum(start_p))
for i in range(T):
    emit_p[i] = log(emit_p[i] / sum(emit_p[i]))
    trans_p[i] = log(trans_p[i] / sum(trans_p[i]))


def viterbi(sentence):
    """维特比算法"""
    sentence = sentence.strip().split()
    obs = [word2id[w] for w in sentence]  # 观测序列
    le = len(obs)  # 序列长度

    # 动态规划矩阵
    dp = np.array([[-1e99] * T] * le)  # 记录节点最大概率对数
    path = np.zeros((le, T), dtype=int)  # 记录上个转移节点

    for j in range(T):
        dp[0][j] = start_p[j] + emit_p[j][obs[0]]

    for i in range(1, le):
        for j in range(T):
            dp[i][j], path[i][j] = max(
                (dp[i - 1][k] + trans_p[k][j] + emit_p[j][obs[i]], k)
                for k in range(T))

    # 隐序列
    states = [np.argmax(dp[le - 1])]
    # 从后到前的循环来依次求出每个单词的词性
    for i in range(le - 2, -1, -1):
        states.insert(0, path[i + 1][states[0]])

    # 打印
    for word, tid in zip(sentence, states):
        print(word, id2tag[tid])


"""测试"""
x = 'Newsweek , trying to keep pace with rival Time magazine ' \
    ', announced new advertising rates for 1990 and said it ' \
    'will introduce a new incentive plan for advertisers .'
viterbi(x)