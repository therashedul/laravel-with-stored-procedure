@extends('../master')
@section('title')
Laravel - PL
@endsection
@section('view')
<h1>View your result</h1><a href="{{route('/')}}">Home</a>
<br>

<table class="table table-responsive" style="text-align:center; margin-left: 60px;">
	<thead>
		<tr>
			<th>Name</th>
			<th>Skills</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		@foreach($employee as  $value)
		<tr>
			<td><?= $value->name ?></td>
			<td><?= $value->skills ?></td>
			<td><?= $value->address ?></td>
			<td>
				<a href="{{ route('edit', ['id'=>$value->id] )}}">Edit</a> /
				<a href="{{ route('delete', ['id'=>$value->id] )}}">Delete</a>
			</td>
		</tr>

		@endforeach
	</tbody>
</table>
@endsection

