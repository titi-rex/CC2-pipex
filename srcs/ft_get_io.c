/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_get_io.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/11 14:21:31 by tlegrand          #+#    #+#             */
/*   Updated: 2023/02/14 17:10:24 by tlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/pipex.h"

void	ft_get_fd(t_pipex *cmd_l, char **arg, int argc)
{
	int	n;

	n = argc - 1;
	cmd_l->fds[0] = -1;
	cmd_l->fds[1] = -1;
	if (!access(arg[1], F_OK | R_OK))
		cmd_l->fds[0] = open(arg[1], O_RDONLY | O_CLOEXEC);
	else if (!ft_strncmp(arg[1], "here_doc", 9))
		cmd_l->fds[0] = cmd_l->pipe[1][0];
	else
		ft_error("Can't open file : ", arg[1]);
	cmd_l->fds[1] = open(arg[n], O_WRONLY | O_TRUNC | O_CLOEXEC | O_CREAT, 420);
	if (cmd_l->fds[1] == -1)
		ft_error("Can't open file : ", arg[n]);
}

