let adjacencyListGraph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

var visited = Array(repeating: false, count: adjacencyListGraph.count)

dfs(adjacencyListGraph, 1)

// DFS 정의
func dfs(_ graph: [[Int]], _ vertex: Int) {
    // 현재 정점을 방문 처리한다.
    visited[vertex] = true
    print("방문: \(vertex)")
    
    // 현재 정점와 연결된 다른 정점을 깊이 우선으로 방문
    for next in graph[vertex] {
        print("다음 방문 대상: \(next)")
        // 현재 정점에서 인접한 대상에 방문 안한 대상일 경우 순환적으로 dfs 실행
        if !visited[next] {
            dfs(graph, next)
        // 이미 방문한 대상일 경우
        } else {
            print("이미 방문 했지롱: \(next)")
        }
    }
}
 
// BFS 정의
func bfs(_ graph: [[Int]], _ vertex: Int) {
    // 큐에 현재 정점을 넣는다.
    var queue = [vertex]
    // 현재 정점을 방문 처리한다.
    visited[vertex] = true
    
    // 큐가 정점이 없을 때까지 반복한다.
    while let newVertex = queue.first {
        queue.removeFirst()
        print("방문: \(newVertex)")
        // 다음 방문할 정점을 큐에 삽입
        for next in graph[newVertex] {
            // 현재 정점에 인접한 대상에 방문 안한 대상일 경우 큐에 넣는다.
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            // 이미 방문한 대상일 경우
            } else {
                print("이미 방문 했지롱: \(next)")
            }
        }
    }
}

//bfs(adjacencyListGraph, 1)
